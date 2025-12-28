// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:esc_pos_printer/esc_pos_printer.dart';
//
// class BluetoothPrintManager {
//
//
//
//   FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
//   List<BluetoothDevice> devices = [];
//
//   // 1. 初始化蓝牙（检查权限+开启蓝牙）
//   Future<bool> initBluetooth() async {
//     // 检查蓝牙是否可用
//     if (!await flutterBlue.isAvailable) {
//       throw Exception("设备不支持蓝牙");
//     }
//     // 开启蓝牙
//     if (!await flutterBlue.isOn) {
//       await flutterBlue.turnOn();
//     }
//     // 申请权限（Android 需手动申请，iOS 自动弹窗）
//     if (Theme.of(context).platform == TargetPlatform.android) {
//       final status = await Permission.bluetoothConnect.request();
//       if (status != PermissionStatus.granted) {
//         throw Exception("蓝牙权限未授予");
//       }
//     }
//     return true;
//   }
//
//   // 2. 扫描蓝牙设备（筛选芝科 XT453）
//   Future<void> scanDevices() async {
//     // 清空历史设备
//     devices.clear();
//     // 开始扫描（超时 4 秒）
//     flutterBlue.startScan(timeout: const Duration(seconds: 4));
//     // 监听扫描结果
//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult result in results) {
//         // 筛选芝科 XT453（设备名称含“XT453”或“ZICOX”）
//         if (result.device.name.contains("XT453") || result.device.name.contains("ZICOX")) {
//           if (!devices.contains(result.device)) {
//             devices.add(result.device);
//           }
//         }
//       }
//     });
//     // 停止扫描
//     await flutterBlue.stopScan();
//   }
//
//   // 3. 连接打印机
//   Future<BluetoothConnection> connectDevice(BluetoothDevice device) async {
//     try {
//       // 建立 BLE 连接（需确认 XT453 的 BLE 服务 UUID/特征 UUID）
//       await device.connect();
//       // 获取打印机的打印服务（芝科 XT453 BLE 服务 UUID 需查官方手册）
//       List<BluetoothService> services = await device.discoverServices();
//       // 找到打印数据写入的特征（TX 特征）
//       BluetoothCharacteristic? writeChar;
//       for (var service in services) {
//         for (var char in service.characteristics) {
//           // 特征需支持 WRITE 操作
//           if (char.properties.write) {
//             writeChar = char;
//             break;
//           }
//         }
//       }
//       if (writeChar == null) {
//         throw Exception("未找到打印机的写入特征");
//       }
//       return BluetoothConnection(device, writeChar);
//     } catch (e) {
//       throw Exception("连接失败：$e");
//     }
//   }
// }