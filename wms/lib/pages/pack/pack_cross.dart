import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/routes.dart';

class PackCrossPage extends StatefulWidget {
  const PackCrossPage({super.key});

  @override
  State<PackCrossPage> createState() => _PackCrossPageState();
}

class _PackCrossPageState extends State<PackCrossPage> {
  bool _isChecked = false;
  String? _scanResult;

  TextEditingController _scanNoController = TextEditingController();

  FocusNode _focusNode = FocusNode();

  List<PackCross> list = [
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
    PackCross("carModelName", "测试左大灯", "skuCode", 1, 2, false),
  ];

  @override
  void initState() {
    super.initState();

    // 监听焦点变化
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // 稍微延迟一下再请求焦点，避免冲突
        Future.microtask(() => _focusNode.requestFocus());
      }
    });
  }

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
        controller: _scanNoController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: '请扫描集货打包',
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
      height: 200.0,
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
                    width: 80.0,
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
        280.0;

    return Container(
      height: totalHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80.0,
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 1, child: _buildLeftItem('数量')),
                Expanded(flex: 1, child: _buildLeftItem('普检')),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      // _submit();
                    },
                    child: _buildLeftItem('打包'),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
              ),
              width: MediaQuery.of(context).size.width - 90.0,
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: list.map((item) => _buildRightItem(item)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftItem(String itemName) {
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

  Widget _buildRightItem(PackCross item) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 130.0,
          decoration: BoxDecoration(color: Color(0x803662EC)),
          padding: EdgeInsets.all(10.0),
          child: Text(
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.clip,
            "${item.skuName} ${item.scanNum}/${item.num}",
            style: TextStyle(fontSize: 12.0, color: Colors.red),
          ),
        ),
        SizedBox(height: 5.0),
      ],
    );
  }

  void _startScan() async {
    final result = await context.push(Routes.qrScanner);
    if (result != null) {
      setState(() {
        _scanResult = result as String?;
        _scanNoController.text = _scanResult ?? '';
      });
      //_loadScanInfo();
    }
  }
}

class PackCross {
  String? carModelName;
  String? skuName;
  String? skuCode;
  int num;
  int scanNum;
  bool isChecked;

  PackCross(
    this.carModelName,
    this.skuName,
    this.skuCode,
    this.num,
    this.scanNum,
    this.isChecked,
  );
}
