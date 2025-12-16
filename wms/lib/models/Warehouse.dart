class Warehouse {
  final int id;
  final int tenantId;
  final int deleted;
  final String createBy;
  final String updateBy;
  final String warehouseCode;
  final String warehouseName;
  final String warehouseType;
  final String? warehouseTypeDesc;
  final int warehouseLevel;
  final String? warehouseLevelDesc;
  final String superiorWarehouseCode;
  final String superiorWarehouseName;
  final String subordinateWarehouseCode;
  final String subordinateWarehouseName;
  final String serviceArea;
  final String collectingWarehouseCode;
  final String collectingWarehouseName;
  final String despatchModel;
  final String despatchModelDesc;
  final String provinceId;
  final String provinceName;
  final String cityId;
  final String cityName;
  final String countyId;
  final String countyName;
  final String? townshipId;
  final String? townshipName;
  final String address;
  final String remark;
  final String gridIds;
  final List<dynamic>? gridIdList;
  final String gridNames;
  final List<dynamic>? gridNameList;
  final int tmsThirdLogistics;
  final String tmsThirdLogisticsName;

  Warehouse({
    required this.id,
    required this.tenantId,
    required this.deleted,
    required this.createBy,
    required this.updateBy,
    required this.warehouseCode,
    required this.warehouseName,
    required this.warehouseType,
    this.warehouseTypeDesc,
    required this.warehouseLevel,
    this.warehouseLevelDesc,
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
    this.townshipId,
    this.townshipName,
    required this.address,
    required this.remark,
    required this.gridIds,
    this.gridIdList,
    required this.gridNames,
    this.gridNameList,
    required this.tmsThirdLogistics,
    required this.tmsThirdLogisticsName,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      id: json['id'] as int,
      tenantId: json['tenantId'] as int,
      deleted: json['deleted'] as int,
      createBy: json['createBy'] as String,
      updateBy: json['updateBy'] as String,
      warehouseCode: json['warehouseCode'] as String,
      warehouseName: json['warehouseName'] as String,
      warehouseType: json['warehouseType'] as String,
      warehouseTypeDesc: json['warehouseTypeDesc'] as String?,
      warehouseLevel: json['warehouseLevel'] as int,
      warehouseLevelDesc: json['warehouseLevelDesc'] as String?,
      superiorWarehouseCode: json['superiorWarehouseCode'] as String,
      superiorWarehouseName: json['superiorWarehouseName'] as String,
      subordinateWarehouseCode: json['subordinateWarehouseCode'] as String,
      subordinateWarehouseName: json['subordinateWarehouseName'] as String,
      serviceArea: json['serviceArea'] as String,
      collectingWarehouseCode: json['collectingWarehouseCode'] as String,
      collectingWarehouseName: json['collectingWarehouseName'] as String,
      despatchModel: json['despatchModel'] as String,
      despatchModelDesc: json['despatchModelDesc'] as String,
      provinceId: json['provinceId'] as String,
      provinceName: json['provinceName'] as String,
      cityId: json['cityId'] as String,
      cityName: json['cityName'] as String,
      countyId: json['countyId'] as String,
      countyName: json['countyName'] as String,
      townshipId: json['townshipId'] as String?,
      townshipName: json['townshipName'] as String?,
      address: json['address'] as String,
      remark: json['remark'] as String,
      gridIds: json['gridIds'] as String,
      gridIdList: json['gridIdList'] == null
          ? null
          : List<dynamic>.from(json['gridIdList']),
      gridNames: json['gridNames'] as String,
      gridNameList: json['gridNameList'] == null
          ? null
          : List<dynamic>.from(json['gridNameList']),
      tmsThirdLogistics: json['tmsThirdLogistics'] as int,
      tmsThirdLogisticsName: json['tmsThirdLogisticsName'] as String,
    );
  }
}
