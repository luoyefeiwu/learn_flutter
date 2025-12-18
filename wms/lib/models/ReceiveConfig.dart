// To parse this JSON data, do
//
//     final ReceiveConfig = ReceiveConfigFromJson(jsonString);

import 'dart:convert';

ReceiveConfig ReceiveConfigFromJson(String str) => ReceiveConfig.fromJson(json.decode(str));

String ReceiveConfigToJson(ReceiveConfig data) => json.encode(data.toJson());

class ReceiveConfig {
  int id;
  String code;
  String name;
  String functionCode;
  String functionName;
  int status;
  int isDefault;
  String operateModelCode;
  String operateModelName;
  String operateClient;
  dynamic startMode;
  dynamic isCheckCommodity;
  dynamic isCheckReservoir;
  dynamic qualityInspectionRepertoryStatusIsFirst;
  dynamic allowNotRecommendGrounding;
  String repertoryStatusCode;
  String repertoryStatusName;
  dynamic inventoryMode;
  dynamic shiftMode;
  dynamic qcQualifiedOptionalList;
  dynamic qcUnqualifiedOptionalList;
  String warehouseCode;
  String warehouseName;
  dynamic isScanSku;

  ReceiveConfig({
    required this.id,
    required this.code,
    required this.name,
    required this.functionCode,
    required this.functionName,
    required this.status,
    required this.isDefault,
    required this.operateModelCode,
    required this.operateModelName,
    required this.operateClient,
    required this.startMode,
    required this.isCheckCommodity,
    required this.isCheckReservoir,
    required this.qualityInspectionRepertoryStatusIsFirst,
    required this.allowNotRecommendGrounding,
    required this.repertoryStatusCode,
    required this.repertoryStatusName,
    required this.inventoryMode,
    required this.shiftMode,
    required this.qcQualifiedOptionalList,
    required this.qcUnqualifiedOptionalList,
    required this.warehouseCode,
    required this.warehouseName,
    required this.isScanSku,
  });

  ReceiveConfig copyWith({
    int? id,
    String? code,
    String? name,
    String? functionCode,
    String? functionName,
    int? status,
    int? isDefault,
    String? operateModelCode,
    String? operateModelName,
    String? operateClient,
    dynamic startMode,
    dynamic isCheckCommodity,
    dynamic isCheckReservoir,
    dynamic qualityInspectionRepertoryStatusIsFirst,
    dynamic allowNotRecommendGrounding,
    String? repertoryStatusCode,
    String? repertoryStatusName,
    dynamic inventoryMode,
    dynamic shiftMode,
    dynamic qcQualifiedOptionalList,
    dynamic qcUnqualifiedOptionalList,
    String? warehouseCode,
    String? warehouseName,
    dynamic isScanSku,
  }) =>
      ReceiveConfig(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        functionCode: functionCode ?? this.functionCode,
        functionName: functionName ?? this.functionName,
        status: status ?? this.status,
        isDefault: isDefault ?? this.isDefault,
        operateModelCode: operateModelCode ?? this.operateModelCode,
        operateModelName: operateModelName ?? this.operateModelName,
        operateClient: operateClient ?? this.operateClient,
        startMode: startMode ?? this.startMode,
        isCheckCommodity: isCheckCommodity ?? this.isCheckCommodity,
        isCheckReservoir: isCheckReservoir ?? this.isCheckReservoir,
        qualityInspectionRepertoryStatusIsFirst: qualityInspectionRepertoryStatusIsFirst ?? this.qualityInspectionRepertoryStatusIsFirst,
        allowNotRecommendGrounding: allowNotRecommendGrounding ?? this.allowNotRecommendGrounding,
        repertoryStatusCode: repertoryStatusCode ?? this.repertoryStatusCode,
        repertoryStatusName: repertoryStatusName ?? this.repertoryStatusName,
        inventoryMode: inventoryMode ?? this.inventoryMode,
        shiftMode: shiftMode ?? this.shiftMode,
        qcQualifiedOptionalList: qcQualifiedOptionalList ?? this.qcQualifiedOptionalList,
        qcUnqualifiedOptionalList: qcUnqualifiedOptionalList ?? this.qcUnqualifiedOptionalList,
        warehouseCode: warehouseCode ?? this.warehouseCode,
        warehouseName: warehouseName ?? this.warehouseName,
        isScanSku: isScanSku ?? this.isScanSku,
      );

  factory ReceiveConfig.fromJson(Map<String, dynamic> json) => ReceiveConfig(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    functionCode: json["functionCode"],
    functionName: json["functionName"],
    status: json["status"],
    isDefault: json["isDefault"],
    operateModelCode: json["operateModelCode"],
    operateModelName: json["operateModelName"],
    operateClient: json["operateClient"],
    startMode: json["startMode"],
    isCheckCommodity: json["isCheckCommodity"],
    isCheckReservoir: json["isCheckReservoir"],
    qualityInspectionRepertoryStatusIsFirst: json["qualityInspectionRepertoryStatusIsFirst"],
    allowNotRecommendGrounding: json["allowNotRecommendGrounding"],
    repertoryStatusCode: json["repertoryStatusCode"],
    repertoryStatusName: json["repertoryStatusName"],
    inventoryMode: json["inventoryMode"],
    shiftMode: json["shiftMode"],
    qcQualifiedOptionalList: json["qcQualifiedOptionalList"],
    qcUnqualifiedOptionalList: json["qcUnqualifiedOptionalList"],
    warehouseCode: json["warehouseCode"],
    warehouseName: json["warehouseName"],
    isScanSku: json["isScanSku"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "functionCode": functionCode,
    "functionName": functionName,
    "status": status,
    "isDefault": isDefault,
    "operateModelCode": operateModelCode,
    "operateModelName": operateModelName,
    "operateClient": operateClient,
    "startMode": startMode,
    "isCheckCommodity": isCheckCommodity,
    "isCheckReservoir": isCheckReservoir,
    "qualityInspectionRepertoryStatusIsFirst": qualityInspectionRepertoryStatusIsFirst,
    "allowNotRecommendGrounding": allowNotRecommendGrounding,
    "repertoryStatusCode": repertoryStatusCode,
    "repertoryStatusName": repertoryStatusName,
    "inventoryMode": inventoryMode,
    "shiftMode": shiftMode,
    "qcQualifiedOptionalList": qcQualifiedOptionalList,
    "qcUnqualifiedOptionalList": qcUnqualifiedOptionalList,
    "warehouseCode": warehouseCode,
    "warehouseName": warehouseName,
    "isScanSku": isScanSku,
  };
}
