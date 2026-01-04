class QualityCheckResponse {
  final int? total;
  final int? current;
  final int? pageSize;
  final List<QualityCheckItem>? list;

  QualityCheckResponse({
    this.total,
    this.current,
    this.pageSize,
    this.list,
  });

  factory QualityCheckResponse.fromJson(Map<String, dynamic> json) {
    var listJson = json['list'] as List?;
    List<QualityCheckItem>? items;
    if (listJson != null) {
      items = listJson.map((e) => QualityCheckItem.fromJson(e)).toList();
    }

    return QualityCheckResponse(
      total: json['total'],
      current: json['current'],
      pageSize: json['pageSize'],
      list: items,
    );
  }
}

class QualityCheckItem {
  final int? id;
  final int? tenantId;
  final String? scanNo;
  final String? type;
  final String? oeCode;
  final String? oeName;
  final int? categoryId;
  final String? categoryName;
  final String? supplierCode;
  final String? supplierName;
  final int? brandCategoryId;
  final String? brandCategoryName;
  final String? qualityCode;
  final String? qualityName;
  final String? returnOrder;
  final String? returnTypeCode;
  final String? returnTypeName;
  final String? returnReason;
  final String? saleNo;
  final String? purchaseOrderCode;
  final String? salesOrderTags;
  final String? inventoryStatusCode;
  final String? inventoryStatusName;
  final String? remark;
  final String? checkUserName;
  final String? qualifiedStatus;
  final String? unqualifiedReason;
  final int? checkCode;
  final String? checkName;
  final int? beforeCheckCode;
  final String? beforeCheckName;
  final String? checkTime;
  final String? warehouseCode;
  final String? warehouseName;
  final int? deleted;
  final String? createBy;
  final String? createTime;
  final String? updateBy;
  final String? updateTime;
  final String? serialNo;
  final String? taskNum;
  final String? drawer;
  final String? repairName;
  final String? carModelName;
  final List<String>? files;
  final String? isStoreInfo;
  final String? followUserName;
  final String? followRecord;
  final String? followTime;
  final String? processingResultCode;
  final String? processingResultName;
  final String? passUserCode;
  final String? passUserName;
  final String? passReasonCode;
  final String? passReasonName;
  final String? passOtherReason;
  final String? otherPassUser;
  final String? sourceName;
  final dynamic checkSourceResp; // 保持 dynamic 因为值为 null
  final int? isBatchOperate;

  QualityCheckItem({
    this.id,
    this.tenantId,
    this.scanNo,
    this.type,
    this.oeCode,
    this.oeName,
    this.categoryId,
    this.categoryName,
    this.supplierCode,
    this.supplierName,
    this.brandCategoryId,
    this.brandCategoryName,
    this.qualityCode,
    this.qualityName,
    this.returnOrder,
    this.returnTypeCode,
    this.returnTypeName,
    this.returnReason,
    this.saleNo,
    this.purchaseOrderCode,
    this.salesOrderTags,
    this.inventoryStatusCode,
    this.inventoryStatusName,
    this.remark,
    this.checkUserName,
    this.qualifiedStatus,
    this.unqualifiedReason,
    this.checkCode,
    this.checkName,
    this.beforeCheckCode,
    this.beforeCheckName,
    this.checkTime,
    this.warehouseCode,
    this.warehouseName,
    this.deleted,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.serialNo,
    this.taskNum,
    this.drawer,
    this.repairName,
    this.carModelName,
    this.files,
    this.isStoreInfo,
    this.followUserName,
    this.followRecord,
    this.followTime,
    this.processingResultCode,
    this.processingResultName,
    this.passUserCode,
    this.passUserName,
    this.passReasonCode,
    this.passReasonName,
    this.passOtherReason,
    this.otherPassUser,
    this.sourceName,
    this.checkSourceResp,
    this.isBatchOperate,
  });

  factory QualityCheckItem.fromJson(Map<String, dynamic> json) {
    var filesJson = json['files'] as List?;
    List<String>? filesList;
    if (filesJson != null) {
      filesList = filesJson.map((e) => e.toString()).toList();
    }

    return QualityCheckItem(
      id: json['id'],
      tenantId: json['tenantId'],
      scanNo: json['scanNo'],
      type: json['type'],
      oeCode: json['oeCode'],
      oeName: json['oeName'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      supplierCode: json['supplierCode'],
      supplierName: json['supplierName'],
      brandCategoryId: json['brandCategoryId'],
      brandCategoryName: json['brandCategoryName'],
      qualityCode: json['qualityCode'],
      qualityName: json['qualityName'],
      returnOrder: json['returnOrder'],
      returnTypeCode: json['returnTypeCode'],
      returnTypeName: json['returnTypeName'],
      returnReason: json['returnReason'],
      saleNo: json['saleNo'],
      purchaseOrderCode: json['purchaseOrderCode'],
      salesOrderTags: json['salesOrderTags'],
      inventoryStatusCode: json['inventoryStatusCode'],
      inventoryStatusName: json['inventoryStatusName'],
      remark: json['remark'],
      checkUserName: json['checkUserName'],
      qualifiedStatus: json['qualifiedStatus'],
      unqualifiedReason: json['unqualifiedReason'],
      checkCode: json['checkCode'],
      checkName: json['checkName'],
      beforeCheckCode: json['beforeCheckCode'],
      beforeCheckName: json['beforeCheckName'],
      checkTime: json['checkTime'],
      warehouseCode: json['warehouseCode'],
      warehouseName: json['warehouseName'],
      deleted: json['deleted'],
      createBy: json['createBy'],
      createTime: json['createTime'],
      updateBy: json['updateBy'],
      updateTime: json['updateTime'],
      serialNo: json['serialNo'],
      taskNum: json['taskNum'],
      drawer: json['drawer'],
      repairName: json['repairName'],
      carModelName: json['carModelName'],
      files: filesList,
      isStoreInfo: json['isStoreInfo'],
      followUserName: json['followUserName'],
      followRecord: json['followRecord'],
      followTime: json['followTime'],
      processingResultCode: json['processingResultCode'],
      processingResultName: json['processingResultName'],
      passUserCode: json['passUserCode'],
      passUserName: json['passUserName'],
      passReasonCode: json['passReasonCode'],
      passReasonName: json['passReasonName'],
      passOtherReason: json['passOtherReason'],
      otherPassUser: json['otherPassUser'],
      sourceName: json['sourceName'],
      checkSourceResp: json['checkSourceResp'],
      isBatchOperate: json['isBatchOperate'],
    );
  }
}