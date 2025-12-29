

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/widgets/common/show_toast_utils.dart';

import '../../models/pack/PackProductInfo.dart';
import '../../router/routes.dart';
import '../../service/receive_service.dart';
import '../../utils/WarehouseUtils.dart';

class PackCrossPage extends StatefulWidget {
  const PackCrossPage({super.key});

  @override
  State<PackCrossPage> createState() => _PackCrossPageState();
}

class _PackCrossPageState extends State<PackCrossPage> {
  // 反扫
  bool _isReverseScanChecked = false;
  String? _scanResult;

  TextEditingController _scanNoController = TextEditingController();

  ReceiveService _receiveService = ReceiveService();

  FocusNode _focusNode = FocusNode();

  PackProductInfo? _packProductInfo;

  List<PackCrossList> list = [];

  int _scanCount = 0;

  // 每扫一次增加的数量
  int _addCount = 1;

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
          setState(() {
            _scanResult = _scanNoController.text.trim();
          });
          _loadScanInfo();
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
                value: _isReverseScanChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isReverseScanChecked = !_isReverseScanChecked;
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
          Text('包装信息提醒', style: TextStyle(fontWeight: FontWeight.bold)),
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
                        _buildPackageRemindLeftItem(
                          title: '有无销售单: ',
                          content: _packProductInfo?.firstPackage == 1
                              ? "有"
                              : "",
                        ),
                        _buildPackageRemindLeftItem(
                          title: '订单备注: ',
                          content: _packProductInfo?.remark,
                        ),
                        _buildPackageRemindLeftItem(
                          title: '订单标签: ',
                          content: _packProductInfo?.orderLabel!,
                        ),
                        _buildPackageRemindLeftItem(
                          title: '物流线路: ',
                          content: _packProductInfo?.logisticsRoute!,
                        ),
                        _buildPackageRemindLeftItem(
                          title: '报价员: ',
                          content: _packProductInfo?.drawer!,
                        ),
                        _buildPackageRemindLeftItem(
                          title: '内部备注: ',
                          content: _packProductInfo?.internalRemarks!,
                        ),
                        _buildPackageRemindLeftItem(
                          title: '集包容器号: ',
                          content: _packProductInfo?.containerNo!,
                        ),
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
                      '${_scanCount}',
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
                      _submit();
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
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              height: totalHeight - 10.0,
              width: MediaQuery.of(context).size.width - 90.0,
              margin: EdgeInsets.only(top: 10.0, left: 1),
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

  Widget _buildRightItem(PackCrossList packCrossList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width - 90.0,
          decoration: BoxDecoration(color: Color(0xFF3662EC)),
          child: Text(
            '车型: ${packCrossList.carModelName}',
            style: TextStyle(color: Colors.white),
          ),
        ),
        for (var item in packCrossList.waitPackList) ...[
          GestureDetector(
            onTap: () {
              list.forEach(
                (e) => e.waitPackList.forEach((a) => a.isChecked = false),
              );
              setState(() {
                item.isChecked = true;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 130.0,
              decoration: BoxDecoration(
                color: item.isChecked ? Color(0x803662EC) : Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "${item.oeCode == null ? '' : item.oeCode}${item.skuName}",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: item.scanNum > 0
                            ? Color(0xFF95F204)
                            : Color(0xFFD9001B),
                      ),
                    ),
                  ),
                  Text(
                    "${item.scanNum}/${item.num}",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: item.scanNum > 0
                          ? Color(0xFF95F204)
                          : Color(0xFFD9001B),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
        ],
      ],
    );
  }

  /// 包装信息提醒内容
  Widget _buildPackageRemindLeftItem({
    required String title,
    required String? content,
  }) {
    return Row(
      children: [
        Text(title),
        Text(
          content == null ? "" : content,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// 加载待打包清单
  void _loadWaitPackList() async {
    var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
    var map = {
      "code": _scanResult,
      "operateConfigModelCode": "scan_store_goods_container_goods_reprint",
      "warehouseCode": warehouseInfo?.warehouseCode,
    };
    var result = await _receiveService.packageScan(map);
    if (result.isSuccess) {
      // 按 carModelName 分组
      Map<String?, List<PackCross>> groupedMap = {};

      for (var item in result.data!.list) {
        String? carModelName = item.carModelName;

        if (!groupedMap.containsKey(carModelName)) {
          groupedMap[carModelName] = [];
        }

        groupedMap[carModelName]!.add(
          PackCross(
            carModelName: item.carModelName,
            skuName: item.oeName,
            skuCode: item.skuCode,
            num: item.totalNum,
            scanNum: 0,
            isChecked: false,
            scanNo: item.scanNo,
            oeCode: item.oeCode,
            skuId: item.skuId,
            saleOrderNo: item.saleOrderNo,
            externalOrderNo: item.externalOrderNo,
            outboundOrderNo: item.outboundOrderNo,
          ),
        );
      }

      // 清空现有列表
      list.clear();

      // 将分组结果转换为 PackCrossList 添加到主列表
      groupedMap.forEach((carModelName, packCrossList) {
        list.add(PackCrossList(carModelName, packCrossList));
      });
    }
    setState(() {
      list = list;
      _scanNoController.text = "";
    });
  }

  Future<void> _loadScanPack() async {
    var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
    var map = {
      "code": _scanNoController.text.trim(),
      "operateConfigModelCode": "scan_store_goods_container_goods_reprint",
      "warehouseCode": warehouseInfo!.warehouseCode,
      "taskNum": _scanNoController.text.trim(),
    };
    var result = await _receiveService.packageScanProduct(map);
    setState(() {
      _scanNoController.text = "";
    });
    if (result.isSuccess) {
      late PackCrossList moveFirstMap;
      late PackCross moveFirstItem;

      bool isComplete = false;
      for (var waitList in list) {
        if (isComplete) break;
        for (var item in waitList.waitPackList) {
          if (isComplete) break;
          if (item.scanNo == result.data!.scanNo) {
            isComplete = true;
            moveFirstMap = waitList;
            moveFirstItem = item;
            if (_isReverseScanChecked) {
              if (item.scanNum < 1) {
                ShowToastUtils.show('已扫数量为0');
                break;
              }
              item.scanNum = item.scanNum - _addCount;
              _scanCount -= _addCount;
              item.isChecked = true;
              _packProductInfo = result.data;
            } else {
              if (item.scanNum >= item.num) {
                ShowToastUtils.show('已超出数量');
                break;
              }
              waitList.waitPackList.forEach((e) => e.isChecked = false);
              setState(() {
                item.scanNum = item.scanNum + _addCount;
                _scanCount += _addCount;
                item.isChecked = true;
                _packProductInfo = result.data;
              });
            }
          }
        }
      }
      _moveItemToTop(moveFirstMap, moveFirstItem);
    }
  }

  void _loadScanInfo() {
    if (list.isEmpty) {
      _loadWaitPackList();
    } else {
      _loadScanPack();
    }
  }

  void _startScan() async {
    final result = await context.push(Routes.qrScanner);
    if (result != null) {
      setState(() {
        _scanResult = result as String?;
        _scanNoController.text = _scanResult ?? '';
      });
      if (list.isEmpty) {
        _loadWaitPackList();
      } else {
        _loadScanPack();
      }
    }
  }

  Future<void> _submit() async {
    var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
    var userInfo = await WarehouseUtils.getUserInfo();
    var packList = [];
    for (var packCross in list) {
      for (var item in packCross.waitPackList) {
        if (item.scanNum > 0) {
          packList.add({
            "oeCode": item.oeCode,
            "oeName": item.skuName,
            "num": item.scanNum,
            "scanNo": item.scanNo,
            "skuId": item.skuId,
            "saleOrderNo": item.saleOrderNo,
            "externalOrderNo": item.externalOrderNo,
            "outboundOrderNo": item.outboundOrderNo,
            "packCode": userInfo?.userId.toString(),
            "packName": userInfo?.realName,
            "operateConfigModelCode":
                "scan_store_goods_container_goods_reprint",
            "warehouseCode": warehouseInfo?.warehouseCode,
            "warehouseName": warehouseInfo?.warehouseName,
            "lstActualScanNo": [
              {"actualScanNo": item.scanNo, "num": item.scanNum},
            ],
          });
        }
      }
    }
    var result = await _receiveService.printPackage(packList);
    if (result.isSuccess) {
      //打印包裹单和销售清单
      _loadWaitPackList();
      ShowToastUtils.show("打印成功,包裹单号:${result.data?.packageNo}");
    }
  }

  /// 将指定项目移动到列表首位
  void _moveItemToTop(PackCrossList waitList, PackCross item) {
    if (waitList != null && item != null) {
      setState(() {
        // 从当前列表中移除该项目
        waitList.waitPackList.remove(item);
        // 将项目添加到列表首位
        waitList.waitPackList.insert(0, item);
        list.remove(waitList);
        list.insert(0, waitList);
      });
    }
  }
}

class PackCrossList {
  ///车型名称
  String? carModelName;

  //待打包列表
  List<PackCross> waitPackList;

  PackCrossList(this.carModelName, this.waitPackList);
}

class PackCross {
  String? carModelName;
  String? skuName;
  String? skuCode;
  int num;
  int scanNum;
  bool isChecked;
  String scanNo;
  String? oeCode;
  int skuId;
  String? saleOrderNo;
  String? externalOrderNo;
  String? outboundOrderNo;

  PackCross({
    required this.carModelName,
    required this.skuName,
    required this.skuCode,
    required this.num,
    required this.scanNum,
    required this.isChecked,
    required this.scanNo,
    required this.oeCode,
    required this.skuId,
    required this.saleOrderNo,
    required this.externalOrderNo,
    required this.outboundOrderNo,
  });
}
