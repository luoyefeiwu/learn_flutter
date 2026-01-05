import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/service/check_service.dart';
import 'package:wms/widgets/common/Loading.dart';

import '../../models/check/QualityCheckResponse.dart';
import '../../router/routes.dart';

class CrossCheckRecordPage extends StatefulWidget {
  const CrossCheckRecordPage({super.key});

  @override
  State<CrossCheckRecordPage> createState() => _CrossCheckRecordPageState();
}

class _CrossCheckRecordPageState extends State<CrossCheckRecordPage> {
  CheckService _checkService = CheckService();

  List<QualityCheckItem> list = [];

  final ScrollController _scrollController = ScrollController();

  ///扫码号
  TextEditingController _scanNoController = TextEditingController();

  int _page = 1;

  FocusNode _focusNode = FocusNode();

  ///加载更多
  bool _isLoadMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData(false);
    _scrollController.addListener(_onScroll);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // 稍微延迟一下再请求焦点，避免冲突
        Future.microtask(() => _focusNode.requestFocus());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('质检记录'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [_buildScanInput(), _buildList()]),
    );
  }

  Widget _buildScanInput() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          Text('零件编码'),
          Expanded(
            child: Container(
              height: 45.0,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: _scanNoController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: '请输入',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(right: 1),
                  isDense: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {
                      _startScan(true);
                    },
                  ),
                ),
                onChanged: (value) {
                  //调用接口
                  //  _startScan(false);
                },
                onSubmitted: (value) async {
                  _startScan(false);
                  // setState(() {
                  //   _scanResult = _scanNoController.text.trim();
                  // });
                  // _loadScanInfo();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    // double topPadding = MediaQuery.of(context).padding.top;
    // double appBarHeight = AppBar().preferredSize.height;
    // double totalTopHeight = topPadding + appBarHeight;
    // double totalBottomHeight = MediaQuery.of(context).padding.bottom;
    // double totalHeight =
    //     MediaQuery.of(context).size.height -
    //     totalTopHeight -
    //     totalBottomHeight -
    //     50;
    return Expanded(
      child: Container(
        // height: totalHeight,
        padding: EdgeInsets.all(10.0),
        child: ListView(
          controller: _scrollController,
          children: [
            for (var item in list) ...[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border(),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.oeName}-| | ${item.qualityName}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF0052D9),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '供应商:${item.supplierName ?? ""}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '集',
                          style: TextStyle(fontSize: 16.0, color: Colors.red),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '采购单号:${item.purchaseOrderCode ?? ""}',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '质检时间:${item.checkTime ?? ""}',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '是否合格:${item.qualifiedStatus == "1" ? "合格" : "不合格"}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '库存状态:${item.inventoryStatusName ?? ""}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    Text(
                      '备注:${item.remark ?? ""}',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Container(
                      child: Wrap(
                        children: [
                          Text('图片:', style: TextStyle(fontSize: 12.0)),
                          ...item.files!
                              .map(
                                (item) => Image.network(
                                  item,
                                  height: 80.0,
                                  width: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          side: BorderSide(color: Color(0xFF0052D9)),
                          backgroundColor: Color(0xFF0052D9),
                          minimumSize: Size(80.0, 30.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          '重新质检',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _loadData(bool isAdd) async {
    var map = {
      "warehouseCode": "HZC02",
      "scanNo": _scanNoController.text.trim(),
      "page": _page,
      "pageSize": 20,
      "followType": 0,
      "processingResultCode": [],
    };
    var result = await _checkService.queryCheckRecord(map);
    if (result.isSuccess) {
      setState(() {
        if (!isAdd) list.clear();
        list.addAll(result.data!.list as Iterable<QualityCheckItem>);
      });
    }
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoadMore) {
      _isLoadMore = true;
      // 滚动到底部
      setState(() {
        _page++;
      });
      try {
        LoadingManager.showLoading(context);
        await _loadData(true);
      } finally {
        LoadingManager.hideLoading(context);
      }
      _isLoadMore = false;
    }
  }

  void _startScan(bool isQrScanner) async {
    if (isQrScanner) {
      final result = await context.push(Routes.qrScanner);
      if (result != null) {
        setState(() {
          _scanNoController.text = (result as String?)!;
        });
        setState(() {
          _page = 1;
        });
        try {
          LoadingManager.showLoading(context);
          await _loadData(false);
        } finally {
          LoadingManager.hideLoading(context);
        }
      }
    } else {
      setState(() {
        _page = 1;
      });
      try {
        LoadingManager.showLoading(context);
        await _loadData(false);
      } finally {
        LoadingManager.hideLoading(context);
      }
    }
  }
}
