import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/r.dart';

import '../../models/receive/CrossStorageScanInfo.dart';
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

  ///扫码信息
  List<CrossStorageScanInfoExt> crossStorageScanInfoList = [];

  FocusNode _focusNode = FocusNode();

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
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('收货入库-越库', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          _buildTitle(),
          _buildScanInput(),
          SizedBox(height: 1.0),
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
        focusNode: _focusNode,
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
          _loadScanInfo();
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
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      _submit();
                    },
                    child: _buildLeftItem('提交', 4),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              height: totalHeight,
              width: MediaQuery.of(context).size.width - 80 - 15 - 15,
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: crossStorageScanInfoList
                    .map((item) => _buildRightItem(item))
                    .toList(),
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

  Widget _buildRightItem(CrossStorageScanInfoExt item) {
    return GestureDetector(
      onTap: () {
        crossStorageScanInfoList.forEach((item) => item.isChecked = false);
        item.isChecked = !item.isChecked;
        setState(() {
          crossStorageScanInfoList = crossStorageScanInfoList;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.only(left: 1.0, right: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(2.0),
                color: item.isChecked
                    ? Color.fromRGBO(16, 151, 14, 0.3)
                    : Colors.white,
                child: Text(
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  item.skuName! +
                      '(${item.planNumbers}/${item.alreadyScanNum!})(${item.skuStatusName})',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            Image.asset(
              item.isCollect == 1
                  ? R.assetsImgCollectionGreen
                  : R.assetsImgCollectionEmpty,
              width: 20.0,
              height: 20.0,
            ),
          ],
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
      _loadScanInfo();
    }
  }

  String getStatus(CrossStorageScanInfo item) {
    String status = '';
    if (item.isEmergency == 1) {
      status += '紧急';
    }
    if (item.isCollect == 1) {
      status += '集';
    }
    if (item.isLargeOrderAArea == 1) {
      status += '大单A区';
    }
    if (item.isLargeOrderBArea == 1) {
      status += '大单B区';
    }
    if (item.isWaitCheck == 1) {
      status += '待检';
    }
    if (item.isCheckSign == 1) {
      status += '签';
    }
    if (item.isPackage == 1) {
      status += '打包';
    }
    return status;
  }

  Future<void> _loadScanInfo() async {
    var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
    if (warehouseInfo == null) {
      Fluttertoast.showToast(msg: '请先选择仓库');
      return;
    }
    var result = await receiveService.crossScanCode({
      "scanNo": _scanNoController.text.trim(),
      "warehouseCode": warehouseInfo!.warehouseCode,
    });
    if (result.isSuccess) {
      String scanNo = result.data!.scanNo!;
      var index = crossStorageScanInfoList.indexWhere(
        (item) => item.scanNo == scanNo,
      );
      if (index > -1) {
        var scanNoInfo = crossStorageScanInfoList[index];
        if (scanNoInfo.planNumbers! > scanNoInfo.alreadyScanNum) {
          scanNoInfo.alreadyScanNum = scanNoInfo.alreadyScanNum + 1;
          crossStorageScanInfoList.forEach((item) => item.isChecked = false);
          scanNoInfo.isChecked = true;

          crossStorageScanInfoList.removeAt(index);
          crossStorageScanInfoList.insert(0, scanNoInfo);

          setState(() {
            crossStorageScanInfoList = crossStorageScanInfoList;
          });
        } else {
          Fluttertoast.showToast(
            msg: '当前零件已经扫完',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black12,
            textColor: Colors.black,
            fontSize: 16.0,
          );
        }
      } else {
        crossStorageScanInfoList.forEach((item) => item.isChecked = false);
        crossStorageScanInfoList.insert(
          0,
          CrossStorageScanInfoExt(
            alreadyScanNum: 1,
            scanNo: scanNo,
            skuName: result.data?.oeName,
            planNumbers: result.data?.planNumbers,
            skuCode: result.data?.skuCode,
            sysSkuCode: result.data?.sysSkuCode,
            warehouseCode: result.data?.warehouseCode,
            warehouseName: "",
            skuStatusName: getStatus(result.data!),
            isChecked: true,
            oeCode: result.data?.oeCode,
            isCollect: result.data?.isCollect ?? 0,
            isEmergency: result.data!.isEmergency ?? 0,
            isWaitCheck: result.data!.isWaitCheck ?? 0,
            isPackage: result.data?.isPackage ?? 0,
            isCheckSign: result.data?.isCheckSign ?? 0,
            isLargeOrderAArea: result.data?.isLargeOrderAArea ?? 0,
            isLargeOrderBArea: result.data?.isLargeOrderBArea ?? 0,
            supplierCode: result.data?.supplierCode ?? "",
          ),
        );
      }
    }

    // 如果未找到，添加新项
    setState(() {
      _scanNoController.text = '';
    });
  }

  Future<void> _submit() async {
    var list = [];
    for (var item in crossStorageScanInfoList) {
      list.add({
        "type": 1,
        "warehouseCode": item.warehouseCode,
        "scanNo": item.scanNo,
        "oeCode": item.oeCode ?? "",
        "inStorageNumbers": item.alreadyScanNum,
        "checkCode": 3,
        "supplierCode": item.supplierCode,
        "isEmergency": item.isEmergency,
        "isWaitCheck": item.isWaitCheck,
        "isCollect": item.isCollect,
        "isPackage": item.isPackage,
        "isCheckSign": item.isCheckSign,
        "isLargeOrderAArea": item.isLargeOrderAArea,
        "isLargeOrderBArea": item.isLargeOrderBArea,
      });
    }
    var result = await receiveService.crossCommit(list);
    if (result.isSuccess) {
      Fluttertoast.showToast(
        msg: '提交成功',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12,
        textColor: Colors.black,
        fontSize: 16.0,
      );
      setState(() {
        crossStorageScanInfoList = [];
      });
    }
  }
}

class CrossStorageScanInfoExt {
  ///已扫码的数量
  int alreadyScanNum;

  ///扫码号
  String? scanNo;

  ///sku名称
  String? skuName;

  /// 计划数
  int? planNumbers;

  /// 旧零件编码
  String? skuCode;

  /// 新零件编码
  String? sysSkuCode;

  /// 仓库编码
  String? warehouseCode;

  /// 仓库名称
  String? warehouseName;

  /// 状态名称
  String? skuStatusName;

  /// 是否选中
  bool isChecked;

  /// oe码
  String? oeCode;

  /// 集货
  int isCollect;

  /// 是否紧急
  int isEmergency;

  /// 是否待检
  int isWaitCheck;

  /// 是否打包
  int isPackage;

  /// 是否签收
  int isCheckSign;

  ///是否大单A区
  int isLargeOrderAArea;

  /// 是否大单B区
  int isLargeOrderBArea;

  /// 供应商编码
  String supplierCode;

  CrossStorageScanInfoExt({
    required this.alreadyScanNum,
    required this.scanNo,
    required this.skuName,
    required this.planNumbers,
    required this.skuCode,
    required this.sysSkuCode,
    required this.warehouseCode,
    required this.warehouseName,
    required this.skuStatusName,
    required this.isChecked,
    required this.oeCode,
    required this.isCollect,
    required this.isEmergency,
    required this.isWaitCheck,
    required this.isPackage,
    required this.isCheckSign,
    required this.isLargeOrderAArea,
    required this.isLargeOrderBArea,
    required this.supplierCode,
  });
}
