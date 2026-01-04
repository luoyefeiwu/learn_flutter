import 'package:flutter/material.dart';
import 'package:wms/service/check_service.dart';

import '../../models/check/QualityCheckResponse.dart';

class CrossCheckRecordPage extends StatefulWidget {
  const CrossCheckRecordPage({super.key});

  @override
  State<CrossCheckRecordPage> createState() => _CrossCheckRecordPageState();
}

class _CrossCheckRecordPageState extends State<CrossCheckRecordPage> {
  CheckService _checkService = CheckService();

  List<QualityCheckItem> list = [];

  final ScrollController _scrollController = ScrollController();

  int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    _scrollController.addListener(_onScroll);
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
                // controller: _scanNoController,
                // focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: '请输入',
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
    double topPadding = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;
    double totalTopHeight = topPadding + appBarHeight;
    double totalBottomHeight = MediaQuery.of(context).padding.bottom;
    double totalHeight =
        MediaQuery.of(context).size.height -
        totalTopHeight -
        totalBottomHeight -
        50;
    return Container(
      height: totalHeight,
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
                    style: TextStyle(fontSize: 14.0, color: Color(0xFF0052D9)),
                  ),
                  Text(
                    '供应商:${item.supplierName ?? ""}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '采购单号:${item.purchaseOrderCode ?? ""}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        '质检时间:${item.checkTime ?? ""}',
                        style: TextStyle(fontSize: 12.0),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: BorderSide(color: Color(0xFF0052D9)),
                        backgroundColor: Color(0xFF0052D9),
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
    );
  }

  Future<void> _loadData() async {
    var map = {
      "warehouseCode": "HZC02",
      "scanNo": "",
      "page": _page,
      "pageSize": 20,
      "followType": 0,
      "processingResultCode": [],
    };
    var result = await _checkService.queryCheckRecord(map);
    if (result.isSuccess) {
      setState(() {
        list.addAll(result.data!.list as Iterable<QualityCheckItem>);
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // 滚动到底部
      setState(() {
        _page++;
      });
      _loadData();
    }
  }
}
