class RepertoryStatus {
  final int id;
  final int tenantId;
  final String repertoryStatusCode;
  final String repertoryStatusName;
  final String warehouseCode;
  final String warehouseName;
  final int deleted;
  final String createBy;
  final DateTime createTime;
  final String updateBy;
  final DateTime updateTime;

  RepertoryStatus({
    required this.id,
    required this.tenantId,
    required this.repertoryStatusCode,
    required this.repertoryStatusName,
    required this.warehouseCode,
    required this.warehouseName,
    required this.deleted,
    required this.createBy,
    required this.createTime,
    required this.updateBy,
    required this.updateTime,
  });

  // 从 JSON Map 构造对象
  factory RepertoryStatus.fromJson(Map<String, dynamic> json) {
    return RepertoryStatus(
      id: json['id'] as int,
      tenantId: json['tenantId'] as int,
      repertoryStatusCode: json['repertoryStatusCode'] as String,
      repertoryStatusName: json['repertoryStatusName'] as String,
      warehouseCode: json['warehouseCode'] as String,
      warehouseName: json['warehouseName'] as String,
      deleted: json['deleted'] as int,
      createBy: json['createBy'] as String,
      createTime: DateTime.parse(json['createTime'] as String),
      updateBy: json['updateBy'] as String,
      updateTime: DateTime.parse(json['updateTime'] as String),
    );
  }

  // 转回 JSON Map（可选，用于发送数据）
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenantId': tenantId,
      'repertoryStatusCode': repertoryStatusCode,
      'repertoryStatusName': repertoryStatusName,
      'warehouseCode': warehouseCode,
      'warehouseName': warehouseName,
      'deleted': deleted,
      'createBy': createBy,
      'createTime': createTime.toIso8601String(),
      'updateBy': updateBy,
      'updateTime': updateTime.toIso8601String(),
    };
  }
}
