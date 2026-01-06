class PrintConfig {
  final int? qspUserId;
  final String? appCode;
  final String? sceneCode;
  final String? sceneDesc;
  final PrintInfo? printInfo;

  PrintConfig({
    this.qspUserId,
    this.appCode,
    this.sceneCode,
    this.sceneDesc,
    this.printInfo,
  });

  factory PrintConfig.fromJson(Map<String, dynamic> json) {
    return PrintConfig(
      qspUserId: json['qspUserId'] as int?,
      appCode: json['appCode'] as String?,
      sceneCode: json['sceneCode'] as String?,
      sceneDesc: json['sceneDesc'] as String?,
      printInfo: json['printInfo'] != null
          ? PrintInfo.fromJson(json['printInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  static List<PrintConfig> fromJsonList(List<dynamic>? list) {
    if (list == null) return [];
    return list
        .map((e) => e is Map<String, dynamic>
        ? PrintConfig.fromJson(e)
        : null)
        .where((e) => e != null)
        .cast<PrintConfig>()
        .toList();
  }
}

class PrintInfo {
  final int? rssi;
  final String? localName;
  final Map<String, dynamic>? advertisData;
  final String? name;
  final List<String>? advertisServiceUUIDs;
  final String? deviceId;

  PrintInfo({
    this.rssi,
    this.localName,
    this.advertisData,
    this.name,
    this.advertisServiceUUIDs,
    this.deviceId,
  });

  factory PrintInfo.fromJson(Map<String, dynamic> json) {
    final advertisServiceUUIDsJson = json['advertisServiceUUIDs'];
    List<String>? advertisServiceUUIDs;
    if (advertisServiceUUIDsJson is List) {
      advertisServiceUUIDs = advertisServiceUUIDsJson
          .map((e) => e is String ? e : null)
          .where((e) => e != null)
          .cast<String>()
          .toList();
    }

    return PrintInfo(
      rssi: json['RSSI'] as int?, // 注意：JSON 中是 "RSSI"（大写）
      localName: json['localName'] as String?,
      advertisData: json['advertisData'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      advertisServiceUUIDs: advertisServiceUUIDs,
      deviceId: json['deviceId'] as String?,
    );
  }
}