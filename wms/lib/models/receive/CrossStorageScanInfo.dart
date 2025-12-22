class CrossStorageScanInfo {
  final String? scanNo;
  final String? oeCode;
  final String? skuCode;
  final String? sysSkuCode;
  final String? oeName;
  final int? planNumbers;
  final int? inStorageNumbers;
  final String? beforeCheckCode;
  final String? checkCode;
  final int? isStoreGoods;
  final int? isApplicationSet;
  final String? supplierCode;
  final String? supplierName;
  final String? warehouseCode;
  final String? orderLabel;
  final List<dynamic>? showOrderLabels;
  final String? outOrderNo;
  final int? isEmergency;
  final int? isWaitCheck;
  final int? isCheckSign;
  final int? isCollect;
  final int? isPackage;
  final int? isLargeOrderAArea;
  final int? isLargeOrderBArea;
  final int? isBatchOperate;
  final int? isShowLogistics;
  final int? isSkuCollect;

  const CrossStorageScanInfo({
    this.scanNo,
    this.oeCode,
    this.skuCode,
    this.sysSkuCode,
    this.oeName,
    this.planNumbers,
    this.inStorageNumbers,
    this.beforeCheckCode,
    this.checkCode,
    this.isStoreGoods,
    this.isApplicationSet,
    this.supplierCode,
    this.supplierName,
    this.warehouseCode,
    this.orderLabel,
    this.showOrderLabels,
    this.outOrderNo,
    this.isEmergency,
    this.isWaitCheck,
    this.isCheckSign,
    this.isCollect,
    this.isPackage,
    this.isLargeOrderAArea,
    this.isLargeOrderBArea,
    this.isBatchOperate,
    this.isShowLogistics,
    this.isSkuCollect,
  });

  // 从 JSON 构建对象
  factory CrossStorageScanInfo.fromJson(Map<String, dynamic> json) {
    return CrossStorageScanInfo(
      scanNo: json['scanNo'] as String?,
      oeCode: json['oeCode'] as String?,
      skuCode: json['skuCode'] as String?,
      sysSkuCode: json['sysSkuCode'] as String?,
      oeName: json['oeName'] as String?,
      planNumbers: json['planNumbers'] is int ? json['planNumbers'] as int : null,
      inStorageNumbers: json['inStorageNumbers'] is int ? json['inStorageNumbers'] as int : null,
      beforeCheckCode: json['beforeCheckCode'] as String?,
      checkCode: json['checkCode'] as String?,
      isStoreGoods: json['isStoreGoods'] is int ? json['isStoreGoods'] as int : null,
      isApplicationSet: json['isApplicationSet'] is int ? json['isApplicationSet'] as int : null,
      supplierCode: json['supplierCode'] as String?,
      supplierName: json['supplierName'] as String?,
      warehouseCode: json['warehouseCode'] as String?,
      orderLabel: json['orderLabel'] as String?,
      showOrderLabels: json['showOrderLabels'] is List ? List.from(json['showOrderLabels']) : null,
      outOrderNo: json['outOrderNo'] as String?,
      isEmergency: json['isEmergency'] is int ? json['isEmergency'] as int : null,
      isWaitCheck: json['isWaitCheck'] is int ? json['isWaitCheck'] as int : null,
      isCheckSign: json['isCheckSign'] is int ? json['isCheckSign'] as int : null,
      isCollect: json['isCollect'] is int ? json['isCollect'] as int : null,
      isPackage: json['isPackage'] is int ? json['isPackage'] as int : null,
      isLargeOrderAArea: json['isLargeOrderAArea'] is int ? json['isLargeOrderAArea'] as int : null,
      isLargeOrderBArea: json['isLargeOrderBArea'] is int ? json['isLargeOrderBArea'] as int : null,
      isBatchOperate: json['isBatchOperate'] is int ? json['isBatchOperate'] as int : null,
      isShowLogistics: json['isShowLogistics'] is int ? json['isShowLogistics'] as int : null,
      isSkuCollect: json['isSkuCollect'] is int ? json['isSkuCollect'] as int : null,
    );
  }

  // 转为 JSON
  Map<String, dynamic> toJson() {
    return {
      'scanNo': scanNo,
      'oeCode': oeCode,
      'skuCode': skuCode,
      'sysSkuCode': sysSkuCode,
      'oeName': oeName,
      'planNumbers': planNumbers,
      'inStorageNumbers': inStorageNumbers,
      'beforeCheckCode': beforeCheckCode,
      'checkCode': checkCode,
      'isStoreGoods': isStoreGoods,
      'isApplicationSet': isApplicationSet,
      'supplierCode': supplierCode,
      'supplierName': supplierName,
      'warehouseCode': warehouseCode,
      'orderLabel': orderLabel,
      'showOrderLabels': showOrderLabels,
      'outOrderNo': outOrderNo,
      'isEmergency': isEmergency,
      'isWaitCheck': isWaitCheck,
      'isCheckSign': isCheckSign,
      'isCollect': isCollect,
      'isPackage': isPackage,
      'isLargeOrderAArea': isLargeOrderAArea,
      'isLargeOrderBArea': isLargeOrderBArea,
      'isBatchOperate': isBatchOperate,
      'isShowLogistics': isShowLogistics,
      'isSkuCollect': isSkuCollect,
    };
  }

  // copyWith 方法：用于创建新实例并覆盖部分字段
  CrossStorageScanInfo copyWith({
    String? scanNo,
    String? oeCode,
    String? skuCode,
    String? sysSkuCode,
    String? oeName,
    int? planNumbers,
    int? inStorageNumbers,
    String? beforeCheckCode,
    String? checkCode,
    int? isStoreGoods,
    int? isApplicationSet,
    String? supplierCode,
    String? supplierName,
    String? warehouseCode,
    String? orderLabel,
    List<dynamic>? showOrderLabels,
    String? outOrderNo,
    int? isEmergency,
    int? isWaitCheck,
    int? isCheckSign,
    int? isCollect,
    int? isPackage,
    int? isLargeOrderAArea,
    int? isLargeOrderBArea,
    int? isBatchOperate,
    int? isShowLogistics,
    int? isSkuCollect,
  }) {
    return CrossStorageScanInfo(
      scanNo: scanNo ?? this.scanNo,
      oeCode: oeCode ?? this.oeCode,
      skuCode: skuCode ?? this.skuCode,
      sysSkuCode: sysSkuCode ?? this.sysSkuCode,
      oeName: oeName ?? this.oeName,
      planNumbers: planNumbers ?? this.planNumbers,
      inStorageNumbers: inStorageNumbers ?? this.inStorageNumbers,
      beforeCheckCode: beforeCheckCode ?? this.beforeCheckCode,
      checkCode: checkCode ?? this.checkCode,
      isStoreGoods: isStoreGoods ?? this.isStoreGoods,
      isApplicationSet: isApplicationSet ?? this.isApplicationSet,
      supplierCode: supplierCode ?? this.supplierCode,
      supplierName: supplierName ?? this.supplierName,
      warehouseCode: warehouseCode ?? this.warehouseCode,
      orderLabel: orderLabel ?? this.orderLabel,
      showOrderLabels: showOrderLabels ?? this.showOrderLabels,
      outOrderNo: outOrderNo ?? this.outOrderNo,
      isEmergency: isEmergency ?? this.isEmergency,
      isWaitCheck: isWaitCheck ?? this.isWaitCheck,
      isCheckSign: isCheckSign ?? this.isCheckSign,
      isCollect: isCollect ?? this.isCollect,
      isPackage: isPackage ?? this.isPackage,
      isLargeOrderAArea: isLargeOrderAArea ?? this.isLargeOrderAArea,
      isLargeOrderBArea: isLargeOrderBArea ?? this.isLargeOrderBArea,
      isBatchOperate: isBatchOperate ?? this.isBatchOperate,
      isShowLogistics: isShowLogistics ?? this.isShowLogistics,
      isSkuCollect: isSkuCollect ?? this.isSkuCollect,
    );
  }
}