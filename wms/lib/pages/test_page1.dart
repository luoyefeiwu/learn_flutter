import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _selectedDevice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('打印机'), centerTitle: true),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                // ✅ 修正：检查扫描状态（静态属性）
                onPressed: () async {
                  if (await FlutterBluePlus.isScanning.first) {
                    FlutterBluePlus.stopScan();
                  } else {
                    scanBluetoothDevice();
                  }
                },
                child: const Text("扫描打印机"),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("打印测试")),
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
    );
  }

  Future<void> _connectDevice(BluetoothDevice device) async {}

  Future<void> scanBluetoothDevice() async {
    // 1. 请求权限（Android）
    if (Platform.isAndroid) {
      var status = await Permission.location.request();
      if (!status.isGranted) {
        print("❌ 位置权限被拒绝");
        return;
      }
    }

    await FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
    //
    // var subscription = FlutterBluePlus.onScanResults.listen((results) {
    //   if (results.isNotEmpty) {
    //     ScanResult r = results.last; // the most recently found device
    //     print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
    //   }
    // }, onError: (e) => print(e));

    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!_devices.contains(result.device)) {
          setState(() => _devices.add(result.device));
        }
      }
    }, onError: (e) => print(e));

    // // 2. 开始扫描（不加服务过滤，先看能否发现）
    // final stream = FlutterBluePlus.scan(timeout: Duration(seconds: 10));
    //
    // final sub = stream.listen(
    //   (result) {
    //     // 方式1：按名称匹配
    //     if (result.device.name == "XT453") {
    //       print("✅ 找到 XT453: ${result.device.id}");
    //       // 可在此处停止扫描并连接
    //       sub.cancel();
    //       _connectToDevice(result.device);
    //       return;
    //     }
    //
    //     // 方式2：按广播服务 UUID 匹配（更可靠）
    //     final targetService = Guid('0000ffe0-0000-1000-8000-00805f9b34fb');
    //     if (result.advertisementData.serviceUuids.contains(targetService)) {
    //       print("✅ 通过服务 UUID 找到 XT453");
    //       sub.cancel();
    //       _connectToDevice(result.device);
    //     }
    //   },
    //   onError: (e) => print("扫描出错: $e"),
    //   onDone: () => print("扫描结束"),
    // );
  }
}
