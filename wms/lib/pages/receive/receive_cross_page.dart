import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../router/routes.dart';
import '../../service/receive_service.dart';
import '../../utils/WarehouseUtils.dart';
import '../../widgets/common/show_toast_utils.dart';

class ReceiveCrossPage extends StatefulWidget {
  const ReceiveCrossPage({super.key});

  @override
  State<ReceiveCrossPage> createState() => _ReceiveCrossPageState();
}

class _ReceiveCrossPageState extends State<ReceiveCrossPage> {
  ReceiveService receiveService = ReceiveService();

  String? _scanResult;

  TextEditingController _scanNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('收货入库-越库', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildTitle(),
          _buildScanInput(),
          SizedBox(height: 10.0),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20.0,
        children: [
          _buildTabs(tabName: '自营-零件', color: Color(0xFF3662EC), type: 0),
          _buildTabs(tabName: '供应商', color: Colors.grey, type: 1),
          _buildTabs(tabName: '重置', color: Colors.red, type: 2),
        ],
      ),
    );
  }

  Widget _buildTabs({
    required String tabName,
    required Color color,
    required int type,
  }) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
      child: Text(tabName, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildScanInput() {
    return Container(
      height: 45.0,
      child: TextField(
        controller: _scanNoController,
        decoration: InputDecoration(
          hintText: '请扫商品码',
          hintStyle: const TextStyle(fontSize: 16),
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.only(right: 1),
          isDense: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              _startScan();
            },
          ),
        ),
        onChanged: (value) {
          //调用接口
        },
        onSubmitted: (value) async {
          var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
          if (warehouseInfo == null) {
            Fluttertoast.showToast(msg: '请先选择仓库');
            return;
          }
          var result = await receiveService.crossScanCode({
            "scanNo": _scanNoController.text,
            "warehouseCode": warehouseInfo!.warehouseCode,
          });
          if (!result.isSuccess) {
            ShowToastUtils.show(result.message);
          }
        },
      ),
    );
  }

  Widget _buildContent() {
    double topPadding = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;
    double totalTopHeight = topPadding + appBarHeight;
    double totalBottomHeight = MediaQuery.of(context).padding.bottom;
    double totalHeight =
        MediaQuery.of(context).size.height -
        totalTopHeight -
        totalBottomHeight -
        130.0;

    return Container(
      height: totalHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 1, child: _buildLeftItem('重标', 1)),
                Expanded(flex: 1, child: _buildLeftItem('数量', 2)),
                Expanded(flex: 1, child: _buildLeftItem('普检', 3)),
                Expanded(flex: 3, child: _buildLeftItem('提交', 4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftItem(String itemName, int type) {
    return Container(
      height: type == 4 ? 180 : 60,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: type == 4 ? Color(0xFF3662EC) : Colors.white,
        border: Border.all(width: 1.0, color: Colors.grey),
      ),
      child: Text(
        itemName,
        style: TextStyle(
          color: type == 4 ? Colors.white : Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _startScan() async {
    final result = await context.push(Routes.qrScanner);
    if (result != null) {
      setState(() {
        _scanResult = result as String?;
        _scanNoController.text = _scanResult ?? '';
      });
    }
  }
}
