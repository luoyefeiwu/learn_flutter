// To parse this JSON data, do
//
//     final CrossStorageResponse = CrossStorageResponseFromJson(jsonString);

import 'dart:convert';

CrossStorageResponse CrossStorageResponseFromJson(String str) => CrossStorageResponse.fromJson(json.decode(str));

String CrossStorageResponseToJson(CrossStorageResponse data) => json.encode(data.toJson());

class CrossStorageResponse {
  String scanNo;
  String oeCode;
  String skuCode;
  String sysSkuCode;
  String oeName;
  int planNumbers;
  int inStorageNumbers;
  int beforeCheckCode;
  int checkCode;
  int isStoreGoods;
  int isApplicationSet;
  String supplierCode;
  String supplierName;
  String warehouseCode;
  String orderLabel;
  List<dynamic> showOrderLabels;
  String outOrderNo;
  int isEmergency;
  int isWaitCheck;
  int isCheckSign;
  int isCollect;
  int isPackage;
  int isLargeOrderAArea;
  int isLargeOrderBArea;
  int isBatchOperate;
  int isShowLogistics;
  int isSkuCollect;

  CrossStorageResponse({
    required this.scanNo,
    required this.oeCode,
    required this.skuCode,
    required this.sysSkuCode,
    required this.oeName,
    required this.planNumbers,
    required this.inStorageNumbers,
    required this.beforeCheckCode,
    required this.checkCode,
    required this.isStoreGoods,
    required this.isApplicationSet,
    required this.supplierCode,
    required this.supplierName,
    required this.warehouseCode,
    required this.orderLabel,
    required this.showOrderLabels,
    required this.outOrderNo,
    required this.isEmergency,
    required this.isWaitCheck,
    required this.isCheckSign,
    required this.isCollect,
    required this.isPackage,
    required this.isLargeOrderAArea,
    required this.isLargeOrderBArea,
    required this.isBatchOperate,
    required this.isShowLogistics,
    required this.isSkuCollect,
  });

  CrossStorageResponse copyWith({
    String? scanNo,
    String? oeCode,
    String? skuCode,
    String? sysSkuCode,
    String? oeName,
    int? planNumbers,
    int? inStorageNumbers,
    int? beforeCheckCode,
    int? checkCode,
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
  }) =>
      CrossStorageResponse(
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

  factory CrossStorageResponse.fromJson(Map<String, dynamic> json) => CrossStorageResponse(
    scanNo: json["scanNo"],
    oeCode: json["oeCode"],
    skuCode: json["skuCode"],
    sysSkuCode: json["sysSkuCode"],
    oeName: json["oeName"],
    planNumbers: json["planNumbers"],
    inStorageNumbers: json["inStorageNumbers"],
    beforeCheckCode: json["beforeCheckCode"],
    checkCode: json["checkCode"],
    isStoreGoods: json["isStoreGoods"],
    isApplicationSet: json["isApplicationSet"],
    supplierCode: json["supplierCode"],
    supplierName: json["supplierName"],
    warehouseCode: json["warehouseCode"],
    orderLabel: json["orderLabel"],
    showOrderLabels: List<dynamic>.from(json["showOrderLabels"].map((x) => x)),
    outOrderNo: json["outOrderNo"],
    isEmergency: json["isEmergency"],
    isWaitCheck: json["isWaitCheck"],
    isCheckSign: json["isCheckSign"],
    isCollect: json["isCollect"],
    isPackage: json["isPackage"],
    isLargeOrderAArea: json["isLargeOrderAArea"],
    isLargeOrderBArea: json["isLargeOrderBArea"],
    isBatchOperate: json["isBatchOperate"],
    isShowLogistics: json["isShowLogistics"],
    isSkuCollect: json["isSkuCollect"],
  );

  Map<String, dynamic> toJson() => {
    "scanNo": scanNo,
    "oeCode": oeCode,
    "skuCode": skuCode,
    "sysSkuCode": sysSkuCode,
    "oeName": oeName,
    "planNumbers": planNumbers,
    "inStorageNumbers": inStorageNumbers,
    "beforeCheckCode": beforeCheckCode,
    "checkCode": checkCode,
    "isStoreGoods": isStoreGoods,
    "isApplicationSet": isApplicationSet,
    "supplierCode": supplierCode,
    "supplierName": supplierName,
    "warehouseCode": warehouseCode,
    "orderLabel": orderLabel,
    "showOrderLabels": List<dynamic>.from(showOrderLabels.map((x) => x)),
    "outOrderNo": outOrderNo,
    "isEmergency": isEmergency,
    "isWaitCheck": isWaitCheck,
    "isCheckSign": isCheckSign,
    "isCollect": isCollect,
    "isPackage": isPackage,
    "isLargeOrderAArea": isLargeOrderAArea,
    "isLargeOrderBArea": isLargeOrderBArea,
    "isBatchOperate": isBatchOperate,
    "isShowLogistics": isShowLogistics,
    "isSkuCollect": isSkuCollect,
  };
}
