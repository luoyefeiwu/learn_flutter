// To parse this JSON data, do
//
//     final Warehouse = WarehouseFromJson(jsonString);

import 'dart:convert';

Warehouse WarehouseFromJson(String str) => Warehouse.fromJson(json.decode(str));

String WarehouseToJson(Warehouse data) => json.encode(data.toJson());

class Warehouse {
  int id;
  int tenantId;
  int deleted;
  String createBy;
  String updateBy;
  String warehouseCode;
  String warehouseName;
  String warehouseType;
  String warehouseTypeDesc;
  int warehouseLevel;
  dynamic warehouseLevelDesc;
  String superiorWarehouseCode;
  String superiorWarehouseName;
  String subordinateWarehouseCode;
  String subordinateWarehouseName;
  String serviceArea;
  String collectingWarehouseCode;
  String collectingWarehouseName;
  String despatchModel;
  String despatchModelDesc;
  String provinceId;
  String provinceName;
  String cityId;
  String cityName;
  String countyId;
  String countyName;
  dynamic townshipId;
  dynamic townshipName;
  String address;
  String remark;
  String gridIds;
  dynamic gridIdList;
  String gridNames;
  dynamic gridNameList;
  int tmsThirdLogistics;
  String tmsThirdLogisticsName;

  Warehouse({
    required this.id,
    required this.tenantId,
    required this.deleted,
    required this.createBy,
    required this.updateBy,
    required this.warehouseCode,
    required this.warehouseName,
    required this.warehouseType,
    required this.warehouseTypeDesc,
    required this.warehouseLevel,
    required this.warehouseLevelDesc,
    required this.superiorWarehouseCode,
    required this.superiorWarehouseName,
    required this.subordinateWarehouseCode,
    required this.subordinateWarehouseName,
    required this.serviceArea,
    required this.collectingWarehouseCode,
    required this.collectingWarehouseName,
    required this.despatchModel,
    required this.despatchModelDesc,
    required this.provinceId,
    required this.provinceName,
    required this.cityId,
    required this.cityName,
    required this.countyId,
    required this.countyName,
    required this.townshipId,
    required this.townshipName,
    required this.address,
    required this.remark,
    required this.gridIds,
    required this.gridIdList,
    required this.gridNames,
    required this.gridNameList,
    required this.tmsThirdLogistics,
    required this.tmsThirdLogisticsName,
  });

  Warehouse copyWith({
    int? id,
    int? tenantId,
    int? deleted,
    String? createBy,
    String? updateBy,
    String? warehouseCode,
    String? warehouseName,
    String? warehouseType,
    String? warehouseTypeDesc,
    int? warehouseLevel,
    dynamic warehouseLevelDesc,
    String? superiorWarehouseCode,
    String? superiorWarehouseName,
    String? subordinateWarehouseCode,
    String? subordinateWarehouseName,
    String? serviceArea,
    String? collectingWarehouseCode,
    String? collectingWarehouseName,
    String? despatchModel,
    String? despatchModelDesc,
    String? provinceId,
    String? provinceName,
    String? cityId,
    String? cityName,
    String? countyId,
    String? countyName,
    dynamic townshipId,
    dynamic townshipName,
    String? address,
    String? remark,
    String? gridIds,
    dynamic gridIdList,
    String? gridNames,
    dynamic gridNameList,
    int? tmsThirdLogistics,
    String? tmsThirdLogisticsName,
  }) =>
      Warehouse(
        id: id ?? this.id,
        tenantId: tenantId ?? this.tenantId,
        deleted: deleted ?? this.deleted,
        createBy: createBy ?? this.createBy,
        updateBy: updateBy ?? this.updateBy,
        warehouseCode: warehouseCode ?? this.warehouseCode,
        warehouseName: warehouseName ?? this.warehouseName,
        warehouseType: warehouseType ?? this.warehouseType,
        warehouseTypeDesc: warehouseTypeDesc ?? this.warehouseTypeDesc,
        warehouseLevel: warehouseLevel ?? this.warehouseLevel,
        warehouseLevelDesc: warehouseLevelDesc ?? this.warehouseLevelDesc,
        superiorWarehouseCode: superiorWarehouseCode ?? this.superiorWarehouseCode,
        superiorWarehouseName: superiorWarehouseName ?? this.superiorWarehouseName,
        subordinateWarehouseCode: subordinateWarehouseCode ?? this.subordinateWarehouseCode,
        subordinateWarehouseName: subordinateWarehouseName ?? this.subordinateWarehouseName,
        serviceArea: serviceArea ?? this.serviceArea,
        collectingWarehouseCode: collectingWarehouseCode ?? this.collectingWarehouseCode,
        collectingWarehouseName: collectingWarehouseName ?? this.collectingWarehouseName,
        despatchModel: despatchModel ?? this.despatchModel,
        despatchModelDesc: despatchModelDesc ?? this.despatchModelDesc,
        provinceId: provinceId ?? this.provinceId,
        provinceName: provinceName ?? this.provinceName,
        cityId: cityId ?? this.cityId,
        cityName: cityName ?? this.cityName,
        countyId: countyId ?? this.countyId,
        countyName: countyName ?? this.countyName,
        townshipId: townshipId ?? this.townshipId,
        townshipName: townshipName ?? this.townshipName,
        address: address ?? this.address,
        remark: remark ?? this.remark,
        gridIds: gridIds ?? this.gridIds,
        gridIdList: gridIdList ?? this.gridIdList,
        gridNames: gridNames ?? this.gridNames,
        gridNameList: gridNameList ?? this.gridNameList,
        tmsThirdLogistics: tmsThirdLogistics ?? this.tmsThirdLogistics,
        tmsThirdLogisticsName: tmsThirdLogisticsName ?? this.tmsThirdLogisticsName,
      );

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    id: json["id"],
    tenantId: json["tenantId"],
    deleted: json["deleted"],
    createBy: json["createBy"],
    updateBy: json["updateBy"],
    warehouseCode: json["warehouseCode"],
    warehouseName: json["warehouseName"],
    warehouseType: json["warehouseType"],
    warehouseTypeDesc: json["warehouseTypeDesc"],
    warehouseLevel: json["warehouseLevel"],
    warehouseLevelDesc: json["warehouseLevelDesc"],
    superiorWarehouseCode: json["superiorWarehouseCode"],
    superiorWarehouseName: json["superiorWarehouseName"],
    subordinateWarehouseCode: json["subordinateWarehouseCode"],
    subordinateWarehouseName: json["subordinateWarehouseName"],
    serviceArea: json["serviceArea"],
    collectingWarehouseCode: json["collectingWarehouseCode"],
    collectingWarehouseName: json["collectingWarehouseName"],
    despatchModel: json["despatchModel"],
    despatchModelDesc: json["despatchModelDesc"],
    provinceId: json["provinceId"],
    provinceName: json["provinceName"],
    cityId: json["cityId"],
    cityName: json["cityName"],
    countyId: json["countyId"],
    countyName: json["countyName"],
    townshipId: json["townshipId"],
    townshipName: json["townshipName"],
    address: json["address"],
    remark: json["remark"],
    gridIds: json["gridIds"],
    gridIdList: json["gridIdList"],
    gridNames: json["gridNames"],
    gridNameList: json["gridNameList"],
    tmsThirdLogistics: json["tmsThirdLogistics"],
    tmsThirdLogisticsName: json["tmsThirdLogisticsName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tenantId": tenantId,
    "deleted": deleted,
    "createBy": createBy,
    "updateBy": updateBy,
    "warehouseCode": warehouseCode,
    "warehouseName": warehouseName,
    "warehouseType": warehouseType,
    "warehouseTypeDesc": warehouseTypeDesc,
    "warehouseLevel": warehouseLevel,
    "warehouseLevelDesc": warehouseLevelDesc,
    "superiorWarehouseCode": superiorWarehouseCode,
    "superiorWarehouseName": superiorWarehouseName,
    "subordinateWarehouseCode": subordinateWarehouseCode,
    "subordinateWarehouseName": subordinateWarehouseName,
    "serviceArea": serviceArea,
    "collectingWarehouseCode": collectingWarehouseCode,
    "collectingWarehouseName": collectingWarehouseName,
    "despatchModel": despatchModel,
    "despatchModelDesc": despatchModelDesc,
    "provinceId": provinceId,
    "provinceName": provinceName,
    "cityId": cityId,
    "cityName": cityName,
    "countyId": countyId,
    "countyName": countyName,
    "townshipId": townshipId,
    "townshipName": townshipName,
    "address": address,
    "remark": remark,
    "gridIds": gridIds,
    "gridIdList": gridIdList,
    "gridNames": gridNames,
    "gridNameList": gridNameList,
    "tmsThirdLogistics": tmsThirdLogistics,
    "tmsThirdLogisticsName": tmsThirdLogisticsName,
  };
}
