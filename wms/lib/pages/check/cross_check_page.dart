import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/service/check_service.dart';
import 'package:wms/widgets/common/common_picker.dart';
import 'package:wms/widgets/common/show_toast_utils.dart';

import '../../models/check/CheckExecutionCountStatus.dart';
import '../../models/check/CrossCheckInfo.dart';
import '../../models/check/RepertoryStatus.dart';
import '../../models/common/CommonModel.dart';
import '../../router/routes.dart';
import '../../utils/WarehouseUtils.dart';
import '../../widgets/common/Loading.dart';

/// 越库质检
class CrossCheckPage extends StatefulWidget {
  const CrossCheckPage({super.key});

  @override
  State<CrossCheckPage> createState() => _CrossCheckPageState();
}

class _CrossCheckPageState extends State<CrossCheckPage> {
  CheckService _checkService = CheckService();

  CrossCheckInfo? crossCheckInfo;

  //是否有扫描结果
  bool isScanHaveResult = false;

  ///扫码号
  TextEditingController _scanNoController = TextEditingController();

  ///单号
  TextEditingController _resourceNoController = TextEditingController();

  //质检合格状态
  int? _checkQualifiedStatus = 0;

  //是否为批量检
  bool? _batchCheck = false;

  CheckExecutionCountStatus? checkExecutionCountStatus;

  /// 库存状态
  List<RepertoryStatus> repertoryStatusList = [];

  RepertoryStatus? _checkRepertoryStatus;

  //放行人
  List<CommonModel> passUserList = [];

  ///选中的放行人
  CommonModel? _checkPassUser;

  //放行原因
  List<CommonModel> passReasonList = [];

  ///选中的放行原因
  CommonModel? _checkPassReason;

  TextEditingController _remarkController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadBasic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('质检'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Text(
            '质检记录',
            style: TextStyle(color: Color.fromARGB(255, 54, 98, 236)),
          ),
        ],
      ),
      bottomSheet: Container(
        // height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(color: Color.fromARGB(255, 54, 98, 236)),
                backgroundColor: Color.fromARGB(255, 54, 98, 236),
              ),
              onPressed: () {
                _submit();
              },
              child: Text('提交', style: TextStyle(color: Colors.white)),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Color(0xFFF8F8F8),
                side: BorderSide(color: Colors.grey, width: 1.0),
              ),
              onPressed: () {},
              child: Text('暂存', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          _buildTitle(
            title: '单号',
            hintText: '请输入',
            icon: Icon(Icons.search),
            onTap: () {},
            controller: _resourceNoController,
            isJumpScan: false,
          ),
          SizedBox(height: 10),
          _buildTitle(
            title: '零件编码',
            hintText: '请扫码',
            icon: Icon(Icons.camera_alt_outlined),
            onTap: () {
              _loadScanNoData();
            },
            controller: _scanNoController,
            isJumpScan: true,
          ),
          SizedBox(height: 10),
          ..._buildContent(),
          SizedBox(height: 60),
        ],
      ),
    );
  }

  List<Widget> _buildContent() {
    List<Widget> list = [];
    if (isScanHaveResult) {
      if (crossCheckInfo != null) {
        list.addAll([
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 3.0,
                  children: [
                    Text(
                      '${crossCheckInfo?.oeName}-${crossCheckInfo?.skuCode} |-${crossCheckInfo?.brandCategoryName == null ? "" : crossCheckInfo?.brandCategoryName}| ${crossCheckInfo?.qualityName == null ? "" : crossCheckInfo?.qualityName}',
                      style: TextStyle(color: Color.fromARGB(255, 54, 98, 236)),
                    ),
                    Text('修理厂: ${crossCheckInfo?.repairName}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('销售单号: ${crossCheckInfo?.salesOrderCode}'),
                        Text('开单人: ${crossCheckInfo?.drawer}'),
                      ],
                    ),
                    Text('报价标签: ${crossCheckInfo?.salesOrderTags}'),
                    Divider(),
                    Text('供应商: ${crossCheckInfo?.supplierName}'),
                    Text('采购单号: ${crossCheckInfo?.purchaseOrderCode}'),
                    Divider(),
                  ],
                ),
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width - 20) / 2,
                bottom: 40.0,
                //alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -30 * math.pi / 180,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0x66EFEF9E),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '紧急集',
                        style: TextStyle(color: Colors.red, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(bottom: 90.0, left: 100.0, child: Text('紧急集')),
            ],
          ),
          _buildFormRadio(label: '是否合格', isRequired: true),
          Divider(),
          _buildSelect(
            label: '库存状态',
            isRequired: true,
            name: _checkRepertoryStatus?.repertoryStatusName ?? "",
            onTap: () {
              CommonPicker.showPicker(
                context: context,
                options: repertoryStatusList
                    .map((e) => e.repertoryStatusName)
                    .toList(),
              ).then((index) {
                setState(() {
                  _checkRepertoryStatus = repertoryStatusList[index!];
                });
              });
            },
          ),
          Divider(),
          SizedBox(height: 1),
          _buildInput(
            label: '备注',
            isRequired: false,
            controller: _remarkController,
          ),
          Divider(),
          _buildSelect(
            label: '放行人 ',
            isRequired: true,
            name: _checkPassUser?.name ?? "",
            onTap: () {
              CommonPicker.showPicker(
                context: context,
                options: passUserList.map((e) => e.name).toList(),
              ).then((index) {
                setState(() {
                  _checkPassUser = passUserList[index!];
                });
              });
            },
          ),
          Divider(),
          SizedBox(height: 1),
          _buildSelect(
            label: '放行原因',
            isRequired: true,
            name: _checkPassReason?.name ?? "",
            onTap: () {
              CommonPicker.showPicker(
                context: context,
                options: passReasonList.map((e) => e.name).toList(),
              ).then((index) {
                setState(() {
                  _checkPassReason = passReasonList[index!];
                });
              });
            },
          ),
          Divider(),
          SizedBox(height: 1),
          // Text('图片上传1'),
          // Text('图片上传2'), Text('图片上传3'),
          // Text('图片上传4'),
        ]);
      }
    } else {
      list.addAll([
        Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            '质检异常汇总(${checkExecutionCountStatus?.followQualifiedNum ?? 0})',
          ),
        ),
        _buildCollect(
          title: '质检异常未跟单',
          count: checkExecutionCountStatus?.checkExectionFollowNum ?? 0,
          onTap: () {},
        ),
        _buildCollect(
          title: '质检异常已跟单',
          count: checkExecutionCountStatus?.checkExectionFollowNum ?? 0,
          onTap: () {},
        ),
        _buildCollect(
          title: '已完成',
          count: checkExecutionCountStatus?.finishNum ?? 0,
          onTap: () {},
        ),
      ]);
    }
    return list;
  }

  Widget _buildInput({
    required String label,
    required bool isRequired,
    required TextEditingController controller,
  }) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          if (isRequired) Text('*', style: TextStyle(color: Colors.red)),
          Text(label, style: TextStyle(fontSize: 15.0, color: Colors.black)),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ), // 调整垂直方向的padding
                hintText: '请输入内容',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormRadio({required String label, required bool isRequired}) {
    return Container(
      height: 30.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          if (isRequired) Text('*', style: TextStyle(color: Colors.red)),
          Text(label, style: TextStyle(fontSize: 15.0, color: Colors.black)),
          Container(
            child: Row(
              children: [
                Radio<int>(
                  visualDensity: VisualDensity(
                    horizontal: -4, // 负值：更紧凑；正值：更宽松（默认为 0）
                  ),
                  value: 1,
                  groupValue: _checkQualifiedStatus,
                  onChanged: (int? value) {
                    setState(() {
                      _checkQualifiedStatus = value;
                    });
                  },
                ),
                Text('合格'),
              ],
            ),
          ),

          Container(
            child: Row(
              children: [
                Radio<int>(
                  visualDensity: VisualDensity(
                    horizontal: -4, // 负值：更紧凑；正值：更宽松（默认为 0）
                  ),
                  value: 2,
                  groupValue: _checkQualifiedStatus,
                  onChanged: (int? value) {
                    setState(() {
                      _checkQualifiedStatus = value;
                    });
                  },
                ),
                Text('不合格'),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Checkbox(
                  visualDensity: VisualDensity(
                    horizontal: -4, // 负值：更紧凑；正值：更宽松（默认为 0）
                  ),
                  value: _batchCheck,
                  onChanged: (bool? value) {
                    setState(() {
                      _batchCheck = value;
                    });
                  },
                ),
                Text('批量检'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelect({
    required String label,
    required bool isRequired,
    required Function onTap,
    required String name,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                if (isRequired) Text('*', style: TextStyle(color: Colors.red)),
                Text(
                  label,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  // border: Border(
                  //   bottom: BorderSide(color: Colors.grey, width: 1.0),
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(name), Icon(Icons.keyboard_arrow_right)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle({
    required String title,
    required String hintText,
    required Icon icon,
    required Function onTap,
    required TextEditingController controller,
    required bool isJumpScan,
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80.0,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(title),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),

                  suffixIcon: IconButton(
                    icon: icon,
                    onPressed: () {
                      if (isJumpScan) {
                        _startScan(controller, onTap);
                      } else if (onTap != null) {
                        onTap();
                      }
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 12.0,
                  ),
                  isDense: true,
                ),
                onSubmitted: (value) {
                  if (controller.text.trim().isNotEmpty) {
                    onTap();
                  }
                },
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    setState(() {
                      isScanHaveResult = true;
                    });
                  } else {
                    setState(() {
                      isScanHaveResult = false;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollect({
    required String title,
    required int count,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text('('),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 54, 98, 236),
              ),
            ),
            Text(')'),
          ],
        ),
      ),
    );
  }

  ///加载扫码接口
  void _loadScanNoData() async {
    var result;
    try {
      LoadingManager.showLoading(context);
      var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
      var map = {
        "scanNo": _scanNoController.text.trim(),
        "resourceNumbers": _resourceNoController.text.trim(),
        "warehouseCode": warehouseInfo?.warehouseCode,
      };
      result = await _checkService.queryScanNoInfo(map);
    } finally {
      LoadingManager.hideLoading(context);
    }
    if (result.isSuccess) {
      setState(() {
        crossCheckInfo = result.data!;
      });
    }
  }

  Future<void> _loadBasic() async {
    var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
    _checkService
        .queryCheckInventor(warehouseInfo!.warehouseCode, 1)
        .then(
          (result) => {
            if (result.isSuccess)
              {
                setState(() {
                  repertoryStatusList = result.data!;
                }),
              },
          },
        );

    _checkService
        .findCheckExection(warehouseInfo.warehouseCode)
        .then(
          (result) => {
            if (result.isSuccess)
              {
                setState(() {
                  checkExecutionCountStatus = result.data;
                }),
              },
          },
        );

    _checkService.findPassUser().then(
      (result) => {
        if (result.isSuccess)
          {
            setState(() {
              passUserList = result.data!;
            }),
          },
      },
    );

    _checkService.findPassReason().then(
      (itme) => {
        if (itme.isSuccess)
          {
            setState(() {
              passReasonList = itme.data!;
            }),
          },
      },
    );
  }

  void _submit() async {
    if (crossCheckInfo == null) {
      ShowToastUtils.show("请扫码");
      return;
    }

    var warehouseInfo = await WarehouseUtils.getWarehouseInfo();
    var map = {
      "scanNo": _scanNoController.text.trim(),
      "qualifiedStatus": _checkQualifiedStatus,
      "inventoryStatusCode": _checkRepertoryStatus?.repertoryStatusCode,
      "remark": _remarkController.text.trim(),
      "unqualifiedReason": "配件破损",
      "warehouseCode": warehouseInfo?.warehouseCode,
      "files": [
        "https://dingteng02.oss-cn-hangzhou.aliyuncs.com/javatest/images/oms/1767092532766WXUQWw1mfDqY0fo4b.png",
      ],
      "recordId": "",
      "id": crossCheckInfo?.id,
      "woodenFrame": crossCheckInfo?.showWoodenFrame,
      "resourceNumbers": crossCheckInfo?.resourceNumbers,
      "num": 1,
      "isEmergency": crossCheckInfo?.isEmergency,
      "isWaitCheck": crossCheckInfo?.isWaitCheck,
      "isCollect": crossCheckInfo?.isCollect,
      "isPackage": crossCheckInfo?.isPackage,
      "isCheckSign": crossCheckInfo?.isCheckSign,
      "isLargeOrderAArea": crossCheckInfo?.isLargeOrderAArea,
      "isLargeOrderBArea": crossCheckInfo?.isLargeOrderBArea,
      "passUserCode": _checkPassUser?.optionCode,
      "passUserName": _checkPassUser?.name,
      "otherPassUser": "",
      "passReasonCode": _checkPassReason?.optionCode,
      "otherReason": "",
    };
    var result;
    try {
      LoadingManager.showLoading(context);
      result = await _checkService.checkCommit(map);
      if (result.isSuccess) {
        ShowToastUtils.show("提交成功");
      }
    } finally {
      LoadingManager.hideLoading(context);
    }
    if (result.isSuccess) {
      setState(() {
        crossCheckInfo = null;
        _checkPassUser = null;
        _checkPassReason = null;
        _checkRepertoryStatus = null;
        _checkQualifiedStatus = 1;
        _batchCheck = false;
        _resourceNoController.text = "";
        _scanNoController.text = "";
      });
    }
  }

  void _startScan(TextEditingController controller, Function onTap) async {
    final result = await context.push(Routes.qrScanner);
    if (result != null) {
      setState(() {
        controller.text = (result as String?)!;
      });
      if (onTap != null) onTap();
    }
  }
}
