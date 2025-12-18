import 'package:flutter/material.dart';

class ReceiveCrossPage extends StatefulWidget {
  const ReceiveCrossPage({super.key});

  @override
  State<ReceiveCrossPage> createState() => _ReceiveCrossPageState();
}

class _ReceiveCrossPageState extends State<ReceiveCrossPage> {
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
          //50
          _buildTitle(),
          //45
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
        decoration: const InputDecoration(
          hintText: '请扫商品码',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.camera_alt_outlined),
        ),
        onChanged: (value) {
          // 扫描结果处理
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
}
