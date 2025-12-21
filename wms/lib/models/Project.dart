class Project {
  int? total;
  int? current;
  int? pageSize;
  List<ProjectItem>? list;

  Project({this.total, this.current, this.pageSize, this.list});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      total: json['total'],
      current: json['current'],
      pageSize: json['pageSize'],
      list: json['list'] != null ? (json['list'] as List).map((i) => ProjectItem.fromJson(i)).toList() : null,
    );
  }
}

class ProjectItem {
  int? id;
  String? projectCode;
  String? projectName;
  int? projectType;
  String? projectTypeDesc;
  int? belId;
  String? belName;
  String? belPrdName;
  String? branchName;
  int? status;
  String? statusDesc;
  String? createBy;
  DateTime? createTime;
  DateTime? finishTime;
  bool? authExec;
  bool? authClose;
  bool? authEval;
  bool? authDataMaint;
  bool? authMerge;
  String? domain;
  DateTime? devToTestTime;
  DateTime? deployTime;

  ProjectItem({
    this.id,
    this.projectCode,
    this.projectName,
    this.projectType,
    this.projectTypeDesc,
    this.belId,
    this.belName,
    this.belPrdName,
    this.branchName,
    this.status,
    this.statusDesc,
    this.createBy,
    this.createTime,
    this.finishTime,
    this.authExec,
    this.authClose,
    this.authEval,
    this.authDataMaint,
    this.authMerge,
    this.domain,
    this.devToTestTime,
    this.deployTime,
  });

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      id: json['id'],
      projectCode: json['projectCode'],
      projectName: json['projectName'],
      projectType: json['projectType'],
      projectTypeDesc: json['projectTypeDesc'],
      belId: json['belId'],
      belName: json['belName'],
      belPrdName: json['belPrdName'],
      branchName: json['branchName'],
      status: json['status'],
      statusDesc: json['statusDesc'],
      createBy: json['createBy'],
      createTime: json['createTime'] != null ? DateTime.parse(json['createTime']) : null,
      finishTime: json['finishTime'] != null ? DateTime.parse(json['finishTime']) : null,
      authExec: json['authExec'],
      authClose: json['authClose'],
      authEval: json['authEval'],
      authDataMaint: json['authDataMaint'],
      authMerge: json['authMerge'],
      domain: json['domain'],
      devToTestTime: json['devToTestTime'] != null ? DateTime.parse(json['devToTestTime']) : null,
      deployTime: json['deployTime'] != null ? DateTime.parse(json['deployTime']) : null,
    );
  }
}