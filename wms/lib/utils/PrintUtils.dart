import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wms/service/print_service.dart';
import 'package:wms/utils/WarehouseUtils.dart';

import '../enum/PrintScene.dart';
import '../models/print/PrintConfig.dart';

class PrintUtils {
  //扫描打印机
  static Future<BluetoothDevice?> scanPrinter(String targetMac) async {
    BluetoothDevice? _device;
    // ✅ 修正：开始扫描（静态方法）
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    // 2. 监听扫描结果
    FlutterBluePlus.scanResults.listen((results) {
      for (final result in results) {
        final device = result.device;
        // 3. Android 可通过 address 获取 MAC
        if (device.remoteId.str == targetMac) {
          FlutterBluePlus.stopScan(); // 停止扫描
          // 4. 连接设备
          _device = device;
          break;
        }
      }
    });
    return _device;
  }

  static void connectAndPrint(
    BluetoothDevice device,
    String targetMac,
    Future<List<int>> Function() dataProvider,
  ) async {
    await device.connect(
      timeout: const Duration(seconds: 10),
      license: License.free,
    );
    // 发现服务（device 实例方法）
    List<BluetoothService> services = await device.discoverServices();
    BluetoothCharacteristic? _printCharacteristic;
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic char in service.characteristics) {
        if (char.properties.write) {
          _printCharacteristic = char;
          break;
        }
      }
    }
    if (_printCharacteristic != null) {
      List<int> data = await dataProvider();
      await _sendLongData(_printCharacteristic, data);
    }
  }

  /// 打印
  static void printInfo({
    required String targetMac,
    required Future<List<int>> Function() dataProvider,
  }) async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    // 2. 监听扫描结果
    FlutterBluePlus.scanResults.listen((results) {
      for (final result in results) {
        final device = result.device;
        // 3. Android 可通过 address 获取 MAC
        if (device.remoteId.str == targetMac) {
          FlutterBluePlus.stopScan(); // 停止扫描
          // 4. 连接设备
          connectAndPrint(device, targetMac, dataProvider);
          break;
        }
      }
    });
  }

  static Future<void> _sendLongData(
    BluetoothCharacteristic? _printCharacteristic,
    List<int> data,
  ) async {
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
  /// 获取打印配置
  static Future<PrintConfig> findMyPrintConfig(PrintScene printScene) async {
    PrintService _printService = PrintService();

    var userInfo = await WarehouseUtils.getUserInfo();
    var map = {
      "qspUserId": userInfo?.userId,
      "appCode": "TMS",
      "sceneCode": null,
    };
    var result = await _printService.findMyPrintConfig(map);
    if (result.isSuccess) {
      var foundConfig = result.data?.firstWhere(
        (element) => element.sceneCode == printScene.code,
        orElse: () => throw Exception('未找到匹配的打印配置'),
      );
      if (foundConfig != null) {
        return foundConfig;
      }
    }
    throw Exception('未找到匹配的打印配置');
  }



}
