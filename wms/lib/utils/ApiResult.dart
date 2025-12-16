class ApiResult<T> {
  final int code;
  final String message;
  final T? data;
  final bool success;

  ApiResult({
    required this.code,
    required this.message,
    this.data,
    required this.success,
  });

  // 成功标识（根据你的后端约定调整）
  bool get isSuccess => code == 200 || code == 0;

  // 工厂方法：从 JSON 解析
  factory ApiResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) dataParser,
  ) {
    return ApiResult<T>(
      code: json['code'] as int? ?? -1,
      message: json['message'] ?? json['msg'] ?? '未知错误',
      data: json['data'] != null ? dataParser(json['data']) : null,
      success: json['success'] as bool? ?? true,
    );
  }
}
