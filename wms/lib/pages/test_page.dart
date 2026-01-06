import 'package:charset_converter/charset_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wms/template/print/PackTemplate.dart';

import '../service/print_service.dart';
import '../utils/PrintUtils.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // ✅ 修正：2.1.0 版本用 FlutterBluePlus() 代替 instance
  // final FlutterBluePlus _flutterBlue = FlutterBluePlus();
  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _selectedDevice;
  BluetoothCharacteristic? _printCharacteristic;

  PrintService _printService = PrintService();

  // 1. 初始化蓝牙（检查权限+开启蓝牙）
  Future<void> _initBluetooth() async {
    // 申请权限（Android）
    // if (Theme.of(context).platform == TargetPlatform.android) {
    //   await [
    //     Permission.bluetoothScan,
    //     Permission.bluetoothConnect,
    //     Permission.location,
    //   ].request();
    // }

    // ✅ 修正：检查蓝牙可用性（静态方法）
    if (!await FlutterBluePlus.isSupported) {
      _showToast("设备不支持蓝牙");
      return;
    }

    // ✅ 修正：开启蓝牙（Android 专属）
    if (!await FlutterBluePlus.isOn) {
      await FlutterBluePlus.turnOn();
    }

    // ✅ 修正：监听蓝牙状态（静态流）
    FlutterBluePlus.state.listen((state) {
      if (state == BluetoothState.off) {
        _showToast("蓝牙已关闭");
      }
    });
  }

  // 2. 扫描芝科 XT453 设备
  Future<void> _scanDevices() async {
    setState(() => _devices.clear());

    // ✅ 修正：监听扫描结果（静态流）
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (result.device.name.isNotEmpty &&
            (result.device.name.contains("XT453") ||
                result.device.name.contains("ZICOX"))) {
          if (!_devices.contains(result.device)) {
            setState(() => _devices.add(result.device));
          }
        }
      }
    });

    // ✅ 修正：开始扫描（静态方法）
    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 10),
      // services: [Guid("0000ffe0-0000-1000-8000-00805f9b34fb")], // 芝科 XT453 服务 UUID
    );

    // 停止扫描
    await Future.delayed(const Duration(seconds: 20));
    await FlutterBluePlus.stopScan();
  }

  // 3. 连接打印机（逻辑不变，device 实例方法无变更）
  Future<void> _connectDevice(BluetoothDevice device) async {
    try {
      setState(() => _selectedDevice = device);

      // 连接设备（device 实例方法）
      await device.connect(
        timeout: const Duration(seconds: 10),
        license: License.free,
      );

      // 发现服务（device 实例方法）
      List<BluetoothService> services = await device.discoverServices();

      // 查找打印特征
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic char in service.characteristics) {
          if (char.properties.write) {
            setState(() => _printCharacteristic = char);
            break;
          }
        }
        if (_printCharacteristic != null) break;
      }

      if (_printCharacteristic == null) {
        _showToast("未找到打印机写入特征");
        await device.disconnect();
        return;
      }

      _showToast("连接成功，可开始打印");
    } catch (e) {
      _showToast("连接失败：$e");
      print(e);
      await device.disconnect();
    }
  }

  // 4. 打印测试（逻辑不变）
  Future<void> _printTest() async {
    if (_printCharacteristic == null) {
      _showToast("未连接打印机");
      return;
    }
    String epl2 = '''
! 0 200 10 100 1\r\n
TEXT 10 20 20 20 包裹BG2312 \r\n
PRINT\r\n
''';
    List<int> data = await CharsetConverter.encode("GBK", epl2);
    try {
      await _printCharacteristic!.write(data, withoutResponse: false);
      _showToast("打印成功");
    } catch (e) {
      print(e);
      _showToast("打印失败：$e");
    }
  }

  // 断开连接
  Future<void> _disconnect() async {
    if (_selectedDevice != null) {
      // 获取当前连接状态（同步）
      BluetoothConnectionState state =
          await _selectedDevice!.connectionState.first;
      if (state == BluetoothConnectionState.connected) {
        await _selectedDevice!.disconnect();
      }
      setState(() {
        _selectedDevice = null;
        _printCharacteristic = null;
      });
      _showToast("已断开连接");
    }
  }

  void _showToast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void initState() {
    super.initState();
    _initBluetooth();
  }

  @override
  void dispose() {
    _disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("芝科 XT453 BLE 打印")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // ✅ 修正：检查扫描状态（静态属性）
                  onPressed: () async {
                    await FlutterBluePlus.stopScan();
                    _scanDevices();
                  },
                  child: const Text("扫描打印机"),
                ),
                ElevatedButton(
                  onPressed: _printCharacteristic == null
                      ? null
                      : printWrapSheet,
                  child: const Text("打印测试"),
                ),
                ElevatedButton(onPressed: printInfo, child: const Text("直接打印")),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (context, index) {
                  BluetoothDevice device = _devices[index];
                  return ListTile(
                    title: Text(device.name),
                    subtitle: Text(device.remoteId.str),
                    // ✅ 2.1.0 用 remoteId 代替 id
                    trailing: device == _selectedDevice
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () => _connectDevice(device),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> printWrapSheet() async {
    var map = {
      "packageCoSourcingNo": "BGHZC0220260106000002",
      "warehouseCode": "HZC02",
      "source": 2,
    };
    var result = await _printService.printWrapSheet(map);
    if (result.isSuccess) {
      if (_printCharacteristic == null) {
        _showToast("未连接打印机");
        return;
      }

      var printPackage = PackTemplate.printPackage(
        time: DateTime.now(),
        list: result.data!,
      );
      List<int> data = await CharsetConverter.encode("GBK", printPackage);
      try {
        _sendLongData(data);
        _showToast("打印成功");
      } catch (e) {
        print(e);
        _showToast("打印失败：$e");
      }
    }
  }

  Future<void> _sendLongData(List<int> data) async {
    const int chunkSize = 200; // 每包200字节，留出安全余量

    for (int i = 0; i < data.length; i += chunkSize) {
      int endIndex = (i + chunkSize < data.length)
          ? i + chunkSize
          : data.length;
      List<int> chunk = data.sublist(i, endIndex);

      await _printCharacteristic!.write(chunk, withoutResponse: false);

      // 添加延迟确保打印机处理
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  Future<void> printInfo() async {
    var map = {
      "packageCoSourcingNo": "BGHZC0220260106000002",
      "warehouseCode": "HZC02",
      "source": 2,
    };
    var result = await _printService.printWrapSheet(map);
    if (result.isSuccess) {
      PrintUtils.printInfo(
        targetMac: "01:39:69:50:73:52",
        dataProvider: () async {
          String epl2 = PackTemplate.printPackage(
            time: DateTime.now(),
            list: result.data!,
          );
          return await CharsetConverter.encode("GBK", epl2);
        },
      );
    }
  }
}
