import 'package:flutter/material.dart';

class PackCrossPage extends StatefulWidget {
  const PackCrossPage({super.key});

  @override
  State<PackCrossPage> createState() => _PackCrossPageState();
}

class _PackCrossPageState extends State<PackCrossPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('集货打包'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildScanInput(),
          _buildCheck(),
          _buildPackageRemind(),
          _buildContent(),
        ],
      ),
    );
  }

  ///扫码框
  Widget _buildScanInput() {
    return Container(
      height: 45.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        // controller: _scanNoController,
        // focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: '请扫描集货打包',
          hintStyle: const TextStyle(fontSize: 16),
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.only(right: 1),
          isDense: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              // _startScan();
            },
          ),
        ),
        onChanged: (value) {
          //调用接口
        },
        onSubmitted: (value) async {
          // _loadScanInfo();
        },
      ),
    );
  }

  /// 反扫
  Widget _buildCheck() {
    return Container(
      height: 30,
      padding: const EdgeInsets.only(right: 10.0, bottom: 0, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text('反扫'),
            ],
          ),
          Text(
            '扫码补打单据',
            style: TextStyle(
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  /// 提醒
  Widget _buildPackageRemind() {
    return Container(
      //height: 200.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Column(
        children: [
          Text('包装信息提醒'),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('有无销售单:'),
                        Text('订单备注:'),
                        Text('订单标签:'),
                        Text('物流线路:'),
                        Text('物流线路:'),
                        Text('内部备注:'),
                        Text('集包容器号:'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.0),
                  ),
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Text('请按顺序打包', style: TextStyle(color: Colors.red, fontSize: 16)),
          // Text('请按顺序打包', style: TextStyle(color: Colors.red, fontSize: 16)),
        ],
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
        300.0;

    return Container(
      height: totalHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 1, child: _buildLeftItem('数量', 2)),
                Expanded(flex: 1, child: _buildLeftItem('普检', 3)),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      // _submit();
                    },
                    child: _buildLeftItem('打包', 4),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              height: totalHeight,
              decoration: BoxDecoration(border: Border.all(width: 1.0)),
              width: MediaQuery.of(context).size.width - 100,
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                // children: crossStorageScanInfoList
                //     .map((item) => _buildRightItem(item))
                //     .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftItem(String itemName, int type) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFF3662EC),
        border: Border.all(width: 1.0, color: Colors.grey),
      ),
      child: Text(
        itemName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
