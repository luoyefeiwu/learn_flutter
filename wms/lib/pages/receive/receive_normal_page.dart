import 'package:flutter/material.dart';

///常规收货
class ReceiveNormalPage extends StatefulWidget {
  const ReceiveNormalPage({super.key});

  @override
  State<ReceiveNormalPage> createState() => _ReceiveNormalPageState();
}

class _ReceiveNormalPageState extends State<ReceiveNormalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('收货入库-常规'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            _buildInput('入库单号', TextEditingController()),
            _buildInput('供应商id', TextEditingController()),
            _buildInput('来源单号', TextEditingController()),
            _buildInput('扫码号', TextEditingController()),
            _buildInput('入库类型', TextEditingController()),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String labelText, TextEditingController controller) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(width: 70.0, child: Text(labelText)),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                hintText: labelText,
                border: OutlineInputBorder(),
                isDense: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         flex: 3,
    //         child: TextField(
    //           controller: controller,
    //           decoration: InputDecoration(
    //             labelText: labelText,
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //       ),
    //       SizedBox(width: 8),
    //       Expanded(
    //         flex: 1,
    //         child: ElevatedButton(
    //           onPressed: () {
    //             // 扫码功能待实现
    //             _scanQRCode();
    //           },
    //           child: Icon(Icons.camera_alt),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  void _scanQRCode() {
    // 这里添加扫码逻辑
    print("打开扫码功能");
    // 通常这里会调用扫码插件，比如 qr_code_scanner
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       backgroundColor: Colors.white,
  //       appBar: AppBar(
  //         title: Text('收货入库-常规'),
  //         centerTitle: true,
  //         backgroundColor: Colors.white,
  //       ),
  //       body: Column(
  //         children: [
  //           _buildInputWithScanButton('收货单号', TextEditingController()),
  //           _buildInputWithScanButton('供应商', TextEditingController()),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
