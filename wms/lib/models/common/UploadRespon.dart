class UploadRespon {
  final String fullUrl;
  final String storeName;
  final String originName;

  UploadRespon({
    required this.fullUrl,
    required this.storeName,
    required this.originName,
  });

  // 从 Map<String, dynamic> 构造对象
  factory UploadRespon.fromJson(Map<String, dynamic> json) {
    return UploadRespon(
      fullUrl: json['fullUrl'] as String,
      storeName: json['storeName'] as String,
      originName: json['originName'] as String,
    );
  }

  // 转回 Map（用于调试或后续处理）
  Map<String, dynamic> toJson() {
    return {
      'fullUrl': fullUrl,
      'storeName': storeName,
      'originName': originName,
    };
  }
}