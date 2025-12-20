class UserInfo {
  final int? userId;
  final int? relationType;
  final int? relationId;
  final int? tenantId;
  final String? tenantName;
  final String? tenantCode;
  final String? realName;
  final String? avatar;
  final List<Role>? roles;
  final List<Org>? orgs;

  UserInfo({
    this.userId,
    this.relationType,
    this.relationId,
    this.tenantId,
    this.tenantName,
    this.tenantCode,
    this.realName,
    this.avatar,
    this.roles,
    this.orgs,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    var rolesJson = json['roles'] as List?;
    var orgsJson = json['orgs'] as List?;

    return UserInfo(
      userId: json['userId'] as int?,
      relationType: json['relationType'] as int?,
      relationId: json['relationId'] as int?,
      tenantId: json['tenantId'] as int?,
      tenantName: json['tenantName'] as String?,
      tenantCode: json['tenantCode'] as String?,
      realName: json['realName'] as String?,
      avatar: json['avatar'] as String?,
      roles: rolesJson
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      orgs: orgsJson
          ?.map((e) => Org.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'relationType': relationType,
      'relationId': relationId,
      'tenantId': tenantId,
      'tenantName': tenantName,
      'tenantCode': tenantCode,
      'realName': realName,
      'avatar': avatar,
      'roles': roles?.map((r) => r.toJson()).toList(),
      'orgs': orgs?.map((o) => o.toJson()).toList(),
    };
  }
}

class Role {
  final int? id;
  final String? roleName;
  final String? roleCode;

  Role({this.id, this.roleName, this.roleCode});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] as int?,
      roleName: json['roleName'] as String?,
      roleCode: json['roleCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'roleName': roleName, 'roleCode': roleCode};
  }
}

class Org {
  final int? id;
  final String? orgName;
  final int? orgType;
  final int? parentId;
  final List<int>? leaderUserIds;

  Org({this.id, this.orgName, this.orgType, this.parentId, this.leaderUserIds});

  factory Org.fromJson(Map<String, dynamic> json) {
    var leaderIds = json['leaderUserIds'] as List?;
    List<int>? leaderUserIdsList;
    if (leaderIds != null) {
      leaderUserIdsList = leaderIds.map((e) => e as int).toList();
    }

    return Org(
      id: json['id'] as int?,
      orgName: json['orgName'] as String?,
      orgType: json['orgType'] as int?,
      parentId: json['parentId'] as int?,
      leaderUserIds: leaderUserIdsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orgName': orgName,
      'orgType': orgType,
      'parentId': parentId,
      'leaderUserIds': leaderUserIds,
    };
  }
}
