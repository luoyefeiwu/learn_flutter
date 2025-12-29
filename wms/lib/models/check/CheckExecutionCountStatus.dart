class CheckExecutionCountStatus {
  final int checkExectionNoFollowNum;
  final int checkExectionFollowNum;
  final int finishNum;
  final int followQualifiedNum;

  CheckExecutionCountStatus({
    required this.checkExectionNoFollowNum,
    required this.checkExectionFollowNum,
    required this.finishNum,
    required this.followQualifiedNum,
  });

  // 从 JSON Map 构造对象
  factory CheckExecutionCountStatus.fromJson(Map<String, dynamic> json) {
    return CheckExecutionCountStatus(
      checkExectionNoFollowNum: json['checkExectionNoFollowNum'] as int? ?? 0,
      checkExectionFollowNum: json['checkExectionFollowNum'] as int? ?? 0,
      finishNum: json['finishNum'] as int? ?? 0,
      followQualifiedNum: json['followQualifiedNum'] as int? ?? 0,
    );
  }

  // 转回 JSON Map（可选，用于序列化）
  Map<String, dynamic> toJson() {
    return {
      'checkExectionNoFollowNum': checkExectionNoFollowNum,
      'checkExectionFollowNum': checkExectionFollowNum,
      'finishNum': finishNum,
      'followQualifiedNum': followQualifiedNum,
    };
  }
}