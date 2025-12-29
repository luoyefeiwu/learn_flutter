class CrossCheckInfo {
  final int? id;
  final int? skuId;
  final int? tenantId;
  final String? inStorageNumber;
  final String? resourceNumbers;
  final String? type;
  final String? typeName;
  final String? status;
  final String? statusDesc;
  final String? oeCode;
  final String? skuCode;
  final String? sysSkuCode;
  final String? oeName;
  final int? categoryId;
  final String? categoryName;
  final String? supplierCode;
  final String? supplierName;
  final String? repairCode;
  final String? repairName;
  final String? goodsInfoCode;
  final String? goodsInfoName;
  final int? brandCategoryId;
  final String? brandCategoryName;
  final String? qualityCode;
  final String? qualityName;
  final String? batchNo;
  final String? scanNo;
  final String? purchaseOrderCode;
  final String? salesOrderCode;
  final String? repertoryStatusCode;
  final String? repertoryStatusName;
  final int? planNumbers;
  final int? inStorageNumbers;
  final String? realityInStorageUserId;
  final String? realityInStorageUserName;
  final String? realityInStorageTime;
  final int? deleted;
  final String? warehouseCode;
  final String? warehouseName;
  final String? checkName;
  final int? checkCode;
  final int? beforCheckCode;
  final String? beforeCheckName;
  final String? salesOrderTags;
  final String? returnOrderType;
  final String? returnOrderReason;
  final String? factoryItemCode;
  final String? createBy;
  final String? createTime;
  final String? updateBy;
  final String? updateTime;
  final String? drawer;
  final String? changeGoodsRemark;
  final List<dynamic>? changeGoodsRemarkImages;
  final List<dynamic>? changeGoodsRemarkErrorImages;
  final int? showWoodenFrame;
  final int? closeNum;
  final String? insteadUserName;
  final int? arriveNum;
  final String? arriveTime;
  final String? isStoreInfo;
  final int? isAccidentOrder;
  final int? isEmergency;
  final int? isWaitCheck;
  final int? isCheckSign;
  final int? isCollect;
  final int? isPackage;
  final int? isLargeOrderAArea;
  final int? isLargeOrderBArea;
  final int? waitCheckNum;
  final int? isBatchOperate;
  final dynamic checkSourceResp;
  final int? isPassCanEdit;
  final dynamic checkPassResp;

  CrossCheckInfo({
    this.id,
    this.skuId,
    this.tenantId,
    this.inStorageNumber,
    this.resourceNumbers,
    this.type,
    this.typeName,
    this.status,
    this.statusDesc,
    this.oeCode,
    this.skuCode,
    this.sysSkuCode,
    this.oeName,
    this.categoryId,
    this.categoryName,
    this.supplierCode,
    this.supplierName,
    this.repairCode,
    this.repairName,
    this.goodsInfoCode,
    this.goodsInfoName,
    this.brandCategoryId,
    this.brandCategoryName,
    this.qualityCode,
    this.qualityName,
    this.batchNo,
    this.scanNo,
    this.purchaseOrderCode,
    this.salesOrderCode,
    this.repertoryStatusCode,
    this.repertoryStatusName,
    this.planNumbers,
    this.inStorageNumbers,
    this.realityInStorageUserId,
    this.realityInStorageUserName,
    this.realityInStorageTime,
    this.deleted,
    this.warehouseCode,
    this.warehouseName,
    this.checkName,
    this.checkCode,
    this.beforCheckCode,
    this.beforeCheckName,
    this.salesOrderTags,
    this.returnOrderType,
    this.returnOrderReason,
    this.factoryItemCode,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.drawer,
    this.changeGoodsRemark,
    this.changeGoodsRemarkImages,
    this.changeGoodsRemarkErrorImages,
    this.showWoodenFrame,
    this.closeNum,
    this.insteadUserName,
    this.arriveNum,
    this.arriveTime,
    this.isStoreInfo,
    this.isAccidentOrder,
    this.isEmergency,
    this.isWaitCheck,
    this.isCheckSign,
    this.isCollect,
    this.isPackage,
    this.isLargeOrderAArea,
    this.isLargeOrderBArea,
    this.waitCheckNum,
    this.isBatchOperate,
    this.checkSourceResp,
    this.isPassCanEdit,
    this.checkPassResp,
  });

  // 工厂构造函数：从 Map<String, dynamic> 创建实例
  factory CrossCheckInfo.fromJson(Map<String, dynamic> json) {
    return CrossCheckInfo(
      id: json['id'] as int?,
      skuId: json['skuId'] as int?,
      tenantId: json['tenantId'] as int?,
      inStorageNumber: json['inStorageNumber'] as String?,
      resourceNumbers: json['resourceNumbers'] as String?,
      type: json['type'] as String?,
      typeName: json['typeName'] as String?,
      status: json['status'] as String?,
      statusDesc: json['statusDesc'] as String?,
      oeCode: json['oeCode'] as String?,
      skuCode: json['skuCode'] as String?,
      sysSkuCode: json['sysSkuCode'] as String?,
      oeName: json['oeName'] as String?,
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      supplierCode: json['supplierCode'] as String?,
      supplierName: json['supplierName'] as String?,
      repairCode: json['repairCode'] as String?,
      repairName: json['repairName'] as String?,
      goodsInfoCode: json['goodsInfoCode'] as String?,
      goodsInfoName: json['goodsInfoName'] as String?,
      brandCategoryId: json['brandCategoryId'] as int?,
      brandCategoryName: json['brandCategoryName'] as String?,
      qualityCode: json['qualityCode'] as String?,
      qualityName: json['qualityName'] as String?,
      batchNo: json['batchNo'] as String?,
      scanNo: json['scanNo'] as String?,
      purchaseOrderCode: json['purchaseOrderCode'] as String?,
      salesOrderCode: json['salesOrderCode'] as String?,
      repertoryStatusCode: json['repertoryStatusCode'] as String?,
      repertoryStatusName: json['repertoryStatusName'] as String?,
      planNumbers: json['planNumbers'] as int?,
      inStorageNumbers: json['inStorageNumbers'] as int?,
      realityInStorageUserId: json['realityInStorageUserId'] as String?,
      realityInStorageUserName: json['realityInStorageUserName'] as String?,
      realityInStorageTime: json['realityInStorageTime'] as String?,
      deleted: json['deleted'] as int?,
      warehouseCode: json['warehouseCode'] as String?,
      warehouseName: json['warehouseName'] as String?,
      checkName: json['checkName'] as String?,
      checkCode: json['checkCode'] as int?,
      beforCheckCode: json['beforCheckCode'] as int?,
      beforeCheckName: json['beforeCheckName'] as String?,
      salesOrderTags: json['salesOrderTags'] as String?,
      returnOrderType: json['returnOrderType'] as String?,
      returnOrderReason: json['returnOrderReason'] as String?,
      factoryItemCode: json['factoryItemCode'] as String?,
      createBy: json['createBy'] as String?,
      createTime: json['createTime'] as String?,
      updateBy: json['updateBy'] as String?,
      updateTime: json['updateTime'] as String?,
      drawer: json['drawer'] as String?,
      changeGoodsRemark: json['changeGoodsRemark'] as String?,
      changeGoodsRemarkImages: json['changeGoodsRemarkImages'] as List<dynamic>?,
      changeGoodsRemarkErrorImages: json['changeGoodsRemarkErrorImages'] as List<dynamic>?,
      showWoodenFrame: json['showWoodenFrame'] as int?,
      closeNum: json['closeNum'] as int?,
      insteadUserName: json['insteadUserName'] as String?,
      arriveNum: json['arriveNum'] as int?,
      arriveTime: json['arriveTime'] as String?,
      isStoreInfo: json['isStoreInfo'] as String?,
      isAccidentOrder: json['isAccidentOrder'] as int?,
      isEmergency: json['isEmergency'] as int?,
      isWaitCheck: json['isWaitCheck'] as int?,
      isCheckSign: json['isCheckSign'] as int?,
      isCollect: json['isCollect'] as int?,
      isPackage: json['isPackage'] as int?,
      isLargeOrderAArea: json['isLargeOrderAArea'] as int?,
      isLargeOrderBArea: json['isLargeOrderBArea'] as int?,
      waitCheckNum: json['waitCheckNum'] as int?,
      isBatchOperate: json['isBatchOperate'] as int?,
      checkSourceResp: json['checkSourceResp'],
      isPassCanEdit: json['isPassCanEdit'] as int?,
      checkPassResp: json['checkPassResp'],
    );
  }

  // 可选：转回 Map（用于调试或上传）
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'skuId': skuId,
      'tenantId': tenantId,
      'inStorageNumber': inStorageNumber,
      'resourceNumbers': resourceNumbers,
      'type': type,
      'typeName': typeName,
      'status': status,
      'statusDesc': statusDesc,
      'oeCode': oeCode,
      'skuCode': skuCode,
      'sysSkuCode': sysSkuCode,
      'oeName': oeName,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'supplierCode': supplierCode,
      'supplierName': supplierName,
      'repairCode': repairCode,
      'repairName': repairName,
      'goodsInfoCode': goodsInfoCode,
      'goodsInfoName': goodsInfoName,
      'brandCategoryId': brandCategoryId,
      'brandCategoryName': brandCategoryName,
      'qualityCode': qualityCode,
      'qualityName': qualityName,
      'batchNo': batchNo,
      'scanNo': scanNo,
      'purchaseOrderCode': purchaseOrderCode,
      'salesOrderCode': salesOrderCode,
      'repertoryStatusCode': repertoryStatusCode,
      'repertoryStatusName': repertoryStatusName,
      'planNumbers': planNumbers,
      'inStorageNumbers': inStorageNumbers,
      'realityInStorageUserId': realityInStorageUserId,
      'realityInStorageUserName': realityInStorageUserName,
      'realityInStorageTime': realityInStorageTime,
      'deleted': deleted,
      'warehouseCode': warehouseCode,
      'warehouseName': warehouseName,
      'checkName': checkName,
      'checkCode': checkCode,
      'beforCheckCode': beforCheckCode,
      'beforeCheckName': beforeCheckName,
      'salesOrderTags': salesOrderTags,
      'returnOrderType': returnOrderType,
      'returnOrderReason': returnOrderReason,
      'factoryItemCode': factoryItemCode,
      'createBy': createBy,
      'createTime': createTime,
      'updateBy': updateBy,
      'updateTime': updateTime,
      'drawer': drawer,
      'changeGoodsRemark': changeGoodsRemark,
      'changeGoodsRemarkImages': changeGoodsRemarkImages,
      'changeGoodsRemarkErrorImages': changeGoodsRemarkErrorImages,
      'showWoodenFrame': showWoodenFrame,
      'closeNum': closeNum,
      'insteadUserName': insteadUserName,
      'arriveNum': arriveNum,
      'arriveTime': arriveTime,
      'isStoreInfo': isStoreInfo,
      'isAccidentOrder': isAccidentOrder,
      'isEmergency': isEmergency,
      'isWaitCheck': isWaitCheck,
      'isCheckSign': isCheckSign,
      'isCollect': isCollect,
      'isPackage': isPackage,
      'isLargeOrderAArea': isLargeOrderAArea,
      'isLargeOrderBArea': isLargeOrderBArea,
      'waitCheckNum': waitCheckNum,
      'isBatchOperate': isBatchOperate,
      'checkSourceResp': checkSourceResp,
      'isPassCanEdit': isPassCanEdit,
      'checkPassResp': checkPassResp,
    };
  }
}