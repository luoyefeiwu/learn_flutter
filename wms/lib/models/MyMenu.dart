import 'dart:convert';

MyMenu MyMenuFromJson(String str) => MyMenu.fromJson(json.decode(str));

String MyMenuToJson(MyMenu data) => json.encode(data.toJson());

class MyMenu {
  List<MyMenu>? children;
  int id;
  String resName;
  String resCode;
  int resType;
  String resPath;
  String resIcon;
  int parentId;
  int resSort;
  List<int> roleIdList;

  MyMenu({
    required this.children,
    required this.id,
    required this.resName,
    required this.resCode,
    required this.resType,
    required this.resPath,
    required this.resIcon,
    required this.parentId,
    required this.resSort,
    required this.roleIdList,
  });

  MyMenu copyWith({
    List<MyMenu>? children,
    int? id,
    String? resName,
    String? resCode,
    int? resType,
    String? resPath,
    String? resIcon,
    int? parentId,
    int? resSort,
    List<int>? roleIdList,
  }) => MyMenu(
    children: children ?? this.children,
    id: id ?? this.id,
    resName: resName ?? this.resName,
    resCode: resCode ?? this.resCode,
    resType: resType ?? this.resType,
    resPath: resPath ?? this.resPath,
    resIcon: resIcon ?? this.resIcon,
    parentId: parentId ?? this.parentId,
    resSort: resSort ?? this.resSort,
    roleIdList: roleIdList ?? this.roleIdList,
  );

  factory MyMenu.fromJson(Map<String, dynamic> json) => MyMenu(
    children: json["children"] == null
        ? []
        : List<MyMenu>.from(json["children"]!.map((x) => MyMenu.fromJson(x))),
    id: json["id"],
    resName: json["resName"],
    resCode: json["resCode"],
    resType: json["resType"],
    resPath: json["resPath"],
    resIcon: json["resIcon"],
    parentId: json["parentId"],
    resSort: json["resSort"],
    roleIdList: List<int>.from(json["roleIdList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "children": children == null
        ? []
        : List<dynamic>.from(children!.map((x) => x.toJson())),
    "id": id,
    "resName": resName,
    "resCode": resCode,
    "resType": resType,
    "resPath": resPath,
    "resIcon": resIcon,
    "parentId": parentId,
    "resSort": resSort,
    "roleIdList": List<dynamic>.from(roleIdList.map((x) => x)),
  };
}
