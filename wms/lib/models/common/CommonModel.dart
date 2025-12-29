class CommonModel {
  final String name;
  final String optionCode;

  CommonModel({
    required this.name,
    required this.optionCode,
  });

  // 从单个 JSON Map 构造对象
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      name: json['name'] as String,
      optionCode: json['optionCode'] as String,
    );
  }

  // 转回 JSON（可选）
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'optionCode': optionCode,
    };
  }
}