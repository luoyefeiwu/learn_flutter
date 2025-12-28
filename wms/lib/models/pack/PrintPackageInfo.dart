class PrintPackageInfo {
  final String? packageNo;
  final String? outboundType;
  final String? outboundTypeName;
  final String? standardCode;
  final String? standardName;

  PrintPackageInfo({
    this.packageNo,
    this.outboundType,
    this.outboundTypeName,
    this.standardCode,
    this.standardName,
  });

  factory PrintPackageInfo.fromJson(Map<String, dynamic> json) {
    return PrintPackageInfo(
      packageNo: json['packageNo'] as String?,
      outboundType: json['outboundType'] as String?,
      outboundTypeName: json['outboundTypeName'] as String?,
      standardCode: json['standardCode'] as String?,
      standardName: json['standardName'] as String?,
    );
  }

  // 可选：用于将对象转回 JSON
  Map<String, dynamic> toJson() {
    return {
      'packageNo': packageNo,
      'outboundType': outboundType,
      'outboundTypeName': outboundTypeName,
      'standardCode': standardCode,
      'standardName': standardName,
    };
  }
}