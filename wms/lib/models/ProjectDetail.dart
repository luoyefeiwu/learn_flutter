class ProjectDetail {
  final int? bindBizCount;
  final int? bindQualityCount;
  final ProjectInfo? projectInfo;
  final ProjectTime? projectTime;
  final Bel? bel;
  final List<ProductManager>? productManagers;
  final List<Developer>? developers;
  final List<Tester>? testers;
  final List<ServiceResp>? serviceRespList;
  final bool? authDevToTest;
  final bool? authTestPass;
  final bool? authPauseDevice;
  final bool? authAllocationDevice;
  final bool? authTabReleasePlan;
  final bool? authPlanMaint;
  final bool? authTabRelease;
  final bool? authTabQuality;
  final bool? authTabEval;
  final bool? authTabStatistics;
  final bool? authPlanTimeMaint;
  final bool? authDevTimeMaint;
  final bool? authTestTimeMaint;
  final bool? authDeployTimeMaint;

  ProjectDetail({
    this.bindBizCount,
    this.bindQualityCount,
    this.projectInfo,
    this.projectTime,
    this.bel,
    this.productManagers,
    this.developers,
    this.testers,
    this.serviceRespList,
    this.authDevToTest,
    this.authTestPass,
    this.authPauseDevice,
    this.authAllocationDevice,
    this.authTabReleasePlan,
    this.authPlanMaint,
    this.authTabRelease,
    this.authTabQuality,
    this.authTabEval,
    this.authTabStatistics,
    this.authPlanTimeMaint,
    this.authDevTimeMaint,
    this.authTestTimeMaint,
    this.authDeployTimeMaint,
  });

  factory ProjectDetail.fromJson(Map<String, dynamic> json) {
    return ProjectDetail(
      bindBizCount: json['bindBizCount'] as int?,
      bindQualityCount: json['bindQualityCount'] as int?,
      projectInfo: json['projectInfo'] != null
          ? ProjectInfo.fromJson(json['projectInfo'] as Map<String, dynamic>)
          : null,
      projectTime: json['projectTime'] != null
          ? ProjectTime.fromJson(json['projectTime'] as Map<String, dynamic>)
          : null,
      bel: json['bel'] != null
          ? Bel.fromJson(json['bel'] as Map<String, dynamic>)
          : null,
      productManagers: (json['productManagers'] as List<dynamic>?)
          ?.map((e) => ProductManager.fromJson(e as Map<String, dynamic>))
          .toList(),
      developers: (json['developers'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      testers: (json['testers'] as List<dynamic>?)
          ?.map((e) => Tester.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceRespList: (json['serviceRespList'] as List<dynamic>?)
          ?.map((e) => ServiceResp.fromJson(e as Map<String, dynamic>))
          .toList(),
      authDevToTest: json['authDevToTest'] as bool?,
      authTestPass: json['authTestPass'] as bool?,
      authPauseDevice: json['authPauseDevice'] as bool?,
      authAllocationDevice: json['authAllocationDevice'] as bool?,
      authTabReleasePlan: json['authTabReleasePlan'] as bool?,
      authPlanMaint: json['authPlanMaint'] as bool?,
      authTabRelease: json['authTabRelease'] as bool?,
      authTabQuality: json['authTabQuality'] as bool?,
      authTabEval: json['authTabEval'] as bool?,
      authTabStatistics: json['authTabStatistics'] as bool?,
      authPlanTimeMaint: json['authPlanTimeMaint'] as bool?,
      authDevTimeMaint: json['authDevTimeMaint'] as bool?,
      authTestTimeMaint: json['authTestTimeMaint'] as bool?,
      authDeployTimeMaint: json['authDeployTimeMaint'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bindBizCount': bindBizCount,
      'bindQualityCount': bindQualityCount,
      'projectInfo': projectInfo?.toJson(),
      'projectTime': projectTime?.toJson(),
      'bel': bel?.toJson(),
      'productManagers':
      productManagers?.map((e) => e.toJson()).toList(),
      'developers': developers?.map((e) => e.toJson()).toList(),
      'testers': testers?.map((e) => e.toJson()).toList(),
      'serviceRespList': serviceRespList?.map((e) => e.toJson()).toList(),
      'authDevToTest': authDevToTest,
      'authTestPass': authTestPass,
      'authPauseDevice': authPauseDevice,
      'authAllocationDevice': authAllocationDevice,
      'authTabReleasePlan': authTabReleasePlan,
      'authPlanMaint': authPlanMaint,
      'authTabRelease': authTabRelease,
      'authTabQuality': authTabQuality,
      'authTabEval': authTabEval,
      'authTabStatistics': authTabStatistics,
      'authPlanTimeMaint': authPlanTimeMaint,
      'authDevTimeMaint': authDevTimeMaint,
      'authTestTimeMaint': authTestTimeMaint,
      'authDeployTimeMaint': authDeployTimeMaint,
    }..removeWhere((key, value) => value == null);
  }
}

class ProjectInfo {
  final int? id;
  final String? projectCode;
  final String? projectName;
  final int? projectType;
  final String? projectTypeDesc;
  final int? belId;
  final String? belName;
  final String? belPrdName;
  final String? wxWebhook;
  final String? branchName;
  final String? apiDomain;
  final String? nacosGroup;
  final String? rabbitInfo;
  final String? rabbitAuth;
  final String? rabbitVhost;
  final int? rabbitAlone;
  final String? deviceIp;
  final String? deviceUser;
  final String? devicePwd;
  final String? deviceInfo;
  final String? deviceInfoCopy;
  final int? deviceStatus;
  final String? dbUser;
  final String? dbPwd;
  final String? dbInfo;
  final String? dbInfoCopy;
  final int? status;
  final String? statusDesc;
  final String? remark;
  final String? createBy;
  final String? createTime;
  final List<String>? moduleList;

  ProjectInfo({
    this.id,
    this.projectCode,
    this.projectName,
    this.projectType,
    this.projectTypeDesc,
    this.belId,
    this.belName,
    this.belPrdName,
    this.wxWebhook,
    this.branchName,
    this.apiDomain,
    this.nacosGroup,
    this.rabbitInfo,
    this.rabbitAuth,
    this.rabbitVhost,
    this.rabbitAlone,
    this.deviceIp,
    this.deviceUser,
    this.devicePwd,
    this.deviceInfo,
    this.deviceInfoCopy,
    this.deviceStatus,
    this.dbUser,
    this.dbPwd,
    this.dbInfo,
    this.dbInfoCopy,
    this.status,
    this.statusDesc,
    this.remark,
    this.createBy,
    this.createTime,
    this.moduleList,
  });

  factory ProjectInfo.fromJson(Map<String, dynamic> json) {
    return ProjectInfo(
      id: json['id'] as int?,
      projectCode: json['projectCode'] as String?,
      projectName: json['projectName'] as String?,
      projectType: json['projectType'] as int?,
      projectTypeDesc: json['projectTypeDesc'] as String?,
      belId: json['belId'] as int?,
      belName: json['belName'] as String?,
      belPrdName: json['belPrdName'] as String?,
      wxWebhook: json['wxWebhook'] as String?,
      branchName: json['branchName'] as String?,
      apiDomain: json['apiDomain'] as String?,
      nacosGroup: json['nacosGroup'] as String?,
      rabbitInfo: json['rabbitInfo'] as String?,
      rabbitAuth: json['rabbitAuth'] as String?,
      rabbitVhost: json['rabbitVhost'] as String?,
      rabbitAlone: json['rabbitAlone'] as int?,
      deviceIp: json['deviceIp'] as String?,
      deviceUser: json['deviceUser'] as String?,
      devicePwd: json['devicePwd'] as String?,
      deviceInfo: json['deviceInfo'] as String?,
      deviceInfoCopy: json['deviceInfoCopy'] as String?,
      deviceStatus: json['deviceStatus'] as int?,
      dbUser: json['dbUser'] as String?,
      dbPwd: json['dbPwd'] as String?,
      dbInfo: json['dbInfo'] as String?,
      dbInfoCopy: json['dbInfoCopy'] as String?,
      status: json['status'] as int?,
      statusDesc: json['statusDesc'] as String?,
      remark: json['remark'] as String?,
      createBy: json['createBy'] as String?,
      createTime: json['createTime'] as String?,
      moduleList: (json['moduleList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectCode': projectCode,
      'projectName': projectName,
      'projectType': projectType,
      'projectTypeDesc': projectTypeDesc,
      'belId': belId,
      'belName': belName,
      'belPrdName': belPrdName,
      'wxWebhook': wxWebhook,
      'branchName': branchName,
      'apiDomain': apiDomain,
      'nacosGroup': nacosGroup,
      'rabbitInfo': rabbitInfo,
      'rabbitAuth': rabbitAuth,
      'rabbitVhost': rabbitVhost,
      'rabbitAlone': rabbitAlone,
      'deviceIp': deviceIp,
      'deviceUser': deviceUser,
      'devicePwd': devicePwd,
      'deviceInfo': deviceInfo,
      'deviceInfoCopy': deviceInfoCopy,
      'deviceStatus': deviceStatus,
      'dbUser': dbUser,
      'dbPwd': dbPwd,
      'dbInfo': dbInfo,
      'dbInfoCopy': dbInfoCopy,
      'status': status,
      'statusDesc': statusDesc,
      'remark': remark,
      'createBy': createBy,
      'createTime': createTime,
      'moduleList': moduleList,
    }..removeWhere((key, value) => value == null);
  }
}

class ProjectTime {
  final String? projectCode;
  final String? planTotestTime;
  final String? actualTotestTime;
  final String? planTestPassTime;
  final String? actualTestPassTime;
  final String? planPreTime;
  final String? actualPreTime;
  final String? planReleaseTime;
  final String? actualReleaseTime;

  ProjectTime({
    this.projectCode,
    this.planTotestTime,
    this.actualTotestTime,
    this.planTestPassTime,
    this.actualTestPassTime,
    this.planPreTime,
    this.actualPreTime,
    this.planReleaseTime,
    this.actualReleaseTime,
  });

  factory ProjectTime.fromJson(Map<String, dynamic> json) {
    return ProjectTime(
      projectCode: json['projectCode'] as String?,
      planTotestTime: json['planTotestTime'] as String?,
      actualTotestTime: json['actualTotestTime'] as String?,
      planTestPassTime: json['planTestPassTime'] as String?,
      actualTestPassTime: json['actualTestPassTime'] as String?,
      planPreTime: json['planPreTime'] as String?,
      actualPreTime: json['actualPreTime'] as String?,
      planReleaseTime: json['planReleaseTime'] as String?,
      actualReleaseTime: json['actualReleaseTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectCode': projectCode,
      'planTotestTime': planTotestTime,
      'actualTotestTime': actualTotestTime,
      'planTestPassTime': planTestPassTime,
      'actualTestPassTime': actualTestPassTime,
      'planPreTime': planPreTime,
      'actualPreTime': actualPreTime,
      'planReleaseTime': planReleaseTime,
      'actualReleaseTime': actualReleaseTime,
    }..removeWhere((key, value) => value == null);
  }
}

class Bel {
  final int? id;
  final String? projectCode;
  final int? staffId;
  final String? staffName;
  final int? roleType;

  Bel({
    this.id,
    this.projectCode,
    this.staffId,
    this.staffName,
    this.roleType,
  });

  factory Bel.fromJson(Map<String, dynamic> json) {
    return Bel(
      id: json['id'] as int?,
      projectCode: json['projectCode'] as String?,
      staffId: json['staffId'] as int?,
      staffName: json['staffName'] as String?,
      roleType: json['roleType'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectCode': projectCode,
      'staffId': staffId,
      'staffName': staffName,
      'roleType': roleType,
    }..removeWhere((key, value) => value == null);
  }
}

class ProductManager {
  final int? id;
  final String? projectCode;
  final int? staffId;
  final String? staffName;
  final int? roleType;

  ProductManager({
    this.id,
    this.projectCode,
    this.staffId,
    this.staffName,
    this.roleType,
  });

  factory ProductManager.fromJson(Map<String, dynamic> json) {
    return ProductManager(
      id: json['id'] as int?,
      projectCode: json['projectCode'] as String?,
      staffId: json['staffId'] as int?,
      staffName: json['staffName'] as String?,
      roleType: json['roleType'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectCode': projectCode,
      'staffId': staffId,
      'staffName': staffName,
      'roleType': roleType,
    }..removeWhere((key, value) => value == null);
  }
}

class Developer {
  final int? id;
  final String? projectCode;
  final int? staffId;
  final String? staffName;
  final int? roleType;

  Developer({
    this.id,
    this.projectCode,
    this.staffId,
    this.staffName,
    this.roleType,
  });

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      id: json['id'] as int?,
      projectCode: json['projectCode'] as String?,
      staffId: json['staffId'] as int?,
      staffName: json['staffName'] as String?,
      roleType: json['roleType'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectCode': projectCode,
      'staffId': staffId,
      'staffName': staffName,
      'roleType': roleType,
    }..removeWhere((key, value) => value == null);
  }
}

class Tester {
  final int? id;
  final String? projectCode;
  final int? staffId;
  final String? staffName;
  final int? roleType;

  Tester({
    this.id,
    this.projectCode,
    this.staffId,
    this.staffName,
    this.roleType,
  });

  factory Tester.fromJson(Map<String, dynamic> json) {
    return Tester(
      id: json['id'] as int?,
      projectCode: json['projectCode'] as String?,
      staffId: json['staffId'] as int?,
      staffName: json['staffName'] as String?,
      roleType: json['roleType'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectCode': projectCode,
      'staffId': staffId,
      'staffName': staffName,
      'roleType': roleType,
    }..removeWhere((key, value) => value == null);
  }
}

class ServiceResp {
  final int? id;
  final String? projectCode;
  final String? serviceCode;
  final String? serviceName;
  final int? serviceType;
  final String? serviceH5DomainUrl;
  final int? devStatus;
  final bool? serverHealth;
  final String? lastInstallTime;
  final String? lastInstallCommit;
  final int? httpPort;
  final int? xxlPort;
  final int? debugPort;
  final String? createBy;
  final String? createTime;
  final String? updateBy;
  final String? updateTime;
  final bool? authDeploy;
  final bool? authRemove;
  final bool? authShutDown;
  final bool? authCheck;
  final bool? authDbSwitch;
  final bool? authDebugSwitch;
  final bool? authConvertPService;
  final String? errorMsg;
  final int? category;
  final String? categoryDesc;
  final SonarCheckDto? sonarCheckDto;
  final String? sonarUrl;
  final int? dbSwitch;
  final int? debugSwitch;

  ServiceResp({
    this.id,
    this.projectCode,
    this.serviceCode,
    this.serviceName,
    this.serviceType,
    this.serviceH5DomainUrl,
    this.devStatus,
    this.serverHealth,
    this.lastInstallTime,
    this.lastInstallCommit,
    this.httpPort,
    this.xxlPort,
    this.debugPort,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.authDeploy,
    this.authRemove,
    this.authShutDown,
    this.authCheck,
    this.authDbSwitch,
    this.authDebugSwitch,
    this.authConvertPService,
    this.errorMsg,
    this.category,
    this.categoryDesc,
    this.sonarCheckDto,
    this.sonarUrl,
    this.dbSwitch,
    this.debugSwitch,
  });

  factory ServiceResp.fromJson(Map<String, dynamic> json) {
    return ServiceResp(
      id: json['id'] as int?,
      projectCode: json['projectCode'] as String?,
      serviceCode: json['serviceCode'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceType: json['serviceType'] as int?,
      serviceH5DomainUrl: json['serviceH5DomainUrl'] as String?,
      devStatus: json['devStatus'] as int?,
      serverHealth: json['serverHealth'] as bool?,
      lastInstallTime: json['lastInstallTime'] as String?,
      lastInstallCommit: json['lastInstallCommit'] as String?,
      httpPort: json['httpPort'] as int?,
      xxlPort: json['xxlPort'] as int?,
      debugPort: json['debugPort'] as int?,
      createBy: json['createBy'] as String?,
      createTime: json['createTime'] as String?,
      updateBy: json['updateBy'] as String?,
      updateTime: json['updateTime'] as String?,
      authDeploy: json['authDeploy'] as bool?,
      authRemove: json['authRemove'] as bool?,
      authShutDown: json['authShutDown'] as bool?,
      authCheck: json['authCheck'] as bool?,
      authDbSwitch: json['authDbSwitch'] as bool?,
      authDebugSwitch: json['authDebugSwitch'] as bool?,
      authConvertPService: json['authConvertPService'] as bool?,
      errorMsg: json['errorMsg'] as String?,
      category: json['category'] as int?,
      categoryDesc: json['categoryDesc'] as String?,
      sonarCheckDto: json['sonarCheckDto'] != null
          ? SonarCheckDto.fromJson(json['sonarCheckDto'] as Map<String, dynamic>)
          : null,
      sonarUrl: json['sonarUrl'] as String?,
      dbSwitch: json['dbSwitch'] as int?,
      debugSwitch: json['debugSwitch'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectCode': projectCode,
      'serviceCode': serviceCode,
      'serviceName': serviceName,
      'serviceType': serviceType,
      'serviceH5DomainUrl': serviceH5DomainUrl,
      'devStatus': devStatus,
      'serverHealth': serverHealth,
      'lastInstallTime': lastInstallTime,
      'lastInstallCommit': lastInstallCommit,
      'httpPort': httpPort,
      'xxlPort': xxlPort,
      'debugPort': debugPort,
      'createBy': createBy,
      'createTime': createTime,
      'updateBy': updateBy,
      'updateTime': updateTime,
      'authDeploy': authDeploy,
      'authRemove': authRemove,
      'authShutDown': authShutDown,
      'authCheck': authCheck,
      'authDbSwitch': authDbSwitch,
      'authDebugSwitch': authDebugSwitch,
      'authConvertPService': authConvertPService,
      'errorMsg': errorMsg,
      'category': category,
      'categoryDesc': categoryDesc,
      'sonarCheckDto': sonarCheckDto?.toJson(),
      'sonarUrl': sonarUrl,
      'dbSwitch': dbSwitch,
      'debugSwitch': debugSwitch,
    }..removeWhere((key, value) => value == null);
  }
}

class SonarCheckDto {
  final int? checkLevel;
  final String? checkLevelDesc;
  final String? checkTime;
  final List<dynamic>? issues;

  SonarCheckDto({
    this.checkLevel,
    this.checkLevelDesc,
    this.checkTime,
    this.issues,
  });

  factory SonarCheckDto.fromJson(Map<String, dynamic> json) {
    return SonarCheckDto(
      checkLevel: json['checkLevel'] as int?,
      checkLevelDesc: json['checkLevelDesc'] as String?,
      checkTime: json['checkTime'] as String?,
      issues: json['issues'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkLevel': checkLevel,
      'checkLevelDesc': checkLevelDesc,
      'checkTime': checkTime,
      'issues': issues,
    }..removeWhere((key, value) => value == null);
  }
}