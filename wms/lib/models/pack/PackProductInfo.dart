class PackProductInfo {
  final String? receiver;
  final String? receiverAddress;
  final int? firstPackage;
  final String? logisticsRoute;
  final String? remark;
  final String? internalRemarks;
  final String? orderLabel;
  final String? scanNo;
  final int? skuId;
  final int? showMsg;
  final String? drawer;
  final String? changeGoodsRemark;
  final List<dynamic>? changeGoodsRemarkImages;
  final List<dynamic>? changeGoodsRemarkErrorImages;
  final int? pickNum;
  final int? checkNum;
  final int? showChangeGoodsRemark;
  final String? skuName;
  final String? oeCode;
  final String? brandName;
  final String? carModelName;
  final String? brandCategoryName;
  final String? warehouseCode;
  final dynamic showOrderLabels; // 原值为 null，类型不确定，用 dynamic
  final String? outOrderNo;
  final String? saleOrderNo;
  final int? isBatchOperate;
  final String? containerNo;
  final String? ordinaryCheckRuleRemark;
  final String? customerName;
  final String? customerCode;

  PackProductInfo({
    this.receiver,
    this.receiverAddress,
    this.firstPackage,
    this.logisticsRoute,
    this.remark,
    this.internalRemarks,
    this.orderLabel,
    this.scanNo,
    this.skuId,
    this.showMsg,
    this.drawer,
    this.changeGoodsRemark,
    this.changeGoodsRemarkImages,
    this.changeGoodsRemarkErrorImages,
    this.pickNum,
    this.checkNum,
    this.showChangeGoodsRemark,
    this.skuName,
    this.oeCode,
    this.brandName,
    this.carModelName,
    this.brandCategoryName,
    this.warehouseCode,
    this.showOrderLabels,
    this.outOrderNo,
    this.saleOrderNo,
    this.isBatchOperate,
    this.containerNo,
    this.ordinaryCheckRuleRemark,
    this.customerName,
    this.customerCode,
  });

  factory PackProductInfo.fromJson(Map<String, dynamic> json) {
    return PackProductInfo(
      receiver: json['receiver'] as String?,
      receiverAddress: json['receiverAddress'] as String?,
      firstPackage: json['firstPackage'] as int?,
      logisticsRoute: json['logisticsRoute'] as String?,
      remark: json['remark'] as String?,
      internalRemarks: json['internalRemarks'] as String?,
      orderLabel: json['orderLabel'] as String?,
      scanNo: json['scanNo'] as String?,
      skuId: json['skuId'] as int?,
      showMsg: json['showMsg'] as int?,
      drawer: json['drawer'] as String?,
      changeGoodsRemark: json['changeGoodsRemark'] as String?,
      changeGoodsRemarkImages: json['changeGoodsRemarkImages'] as List<dynamic>?,
      changeGoodsRemarkErrorImages: json['changeGoodsRemarkErrorImages'] as List<dynamic>?,
      pickNum: json['pickNum'] as int?,
      checkNum: json['checkNum'] as int?,
      showChangeGoodsRemark: json['showChangeGoodsRemark'] as int?,
      skuName: json['skuName'] as String?,
      oeCode: json['oeCode'] as String?,
      brandName: json['brandName'] as String?,
      carModelName: json['carModelName'] as String?,
      brandCategoryName: json['brandCategoryName'] as String?,
      warehouseCode: json['warehouseCode'] as String?,
      showOrderLabels: json['showOrderLabels'], // 保持 dynamic
      outOrderNo: json['outOrderNo'] as String?,
      saleOrderNo: json['saleOrderNo'] as String?,
      isBatchOperate: json['isBatchOperate'] as int?,
      containerNo: json['containerNo'] as String?,
      ordinaryCheckRuleRemark: json['ordinaryCheckRuleRemark'] as String?,
      customerName: json['customerName'] as String?,
      customerCode: json['customerCode'] as String?,
    );
  }

  // 可选：添加 toJson 方法（如果需要序列化回 JSON）
  Map<String, dynamic> toJson() {
    return {
      'receiver': receiver,
      'receiverAddress': receiverAddress,
      'firstPackage': firstPackage,
      'logisticsRoute': logisticsRoute,
      'remark': remark,
      'internalRemarks': internalRemarks,
      'orderLabel': orderLabel,
      'scanNo': scanNo,
      'skuId': skuId,
      'showMsg': showMsg,
      'drawer': drawer,
      'changeGoodsRemark': changeGoodsRemark,
      'changeGoodsRemarkImages': changeGoodsRemarkImages,
      'changeGoodsRemarkErrorImages': changeGoodsRemarkErrorImages,
      'pickNum': pickNum,
      'checkNum': checkNum,
      'showChangeGoodsRemark': showChangeGoodsRemark,
      'skuName': skuName,
      'oeCode': oeCode,
      'brandName': brandName,
      'carModelName': carModelName,
      'brandCategoryName': brandCategoryName,
      'warehouseCode': warehouseCode,
      'showOrderLabels': showOrderLabels,
      'outOrderNo': outOrderNo,
      'saleOrderNo': saleOrderNo,
      'isBatchOperate': isBatchOperate,
      'containerNo': containerNo,
      'ordinaryCheckRuleRemark': ordinaryCheckRuleRemark,
      'customerName': customerName,
      'customerCode': customerCode,
    };
  }
}