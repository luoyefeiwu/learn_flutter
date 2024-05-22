import 'package:json_annotation/json_annotation.dart';

part 'MyMenu.g.dart';

@JsonSerializable()
class MyMenu {
  int? code;
  int? parentId;
  String? resCode;
  String? resIcon;
  String? resPath;
  String? resName;
  int? resSort;
  int? resType;

  MyMenu();

  factory MyMenu.fromJson(Map<String, dynamic> json) => _$MyMenuFromJson(json);

  Map<String, dynamic> toJson(MyMenu instance) => _$MyMenuToJson(instance);
}
