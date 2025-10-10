// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyMenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyMenu _$MyMenuFromJson(Map<String, dynamic> json) => MyMenu()
  ..code = json['code'] as int?
  ..parentId = json['parentId'] as int?
  ..resCode = json['resCode'] as String?
  ..resIcon = json['resIcon'] as String?
  ..resPath = json['resPath'] as String?
  ..resName = json['resName'] as String?
  ..resSort = json['resSort'] as int?
  ..resType = json['resType'] as int?;

Map<String, dynamic> _$MyMenuToJson(MyMenu instance) => <String, dynamic>{
      'code': instance.code,
      'parentId': instance.parentId,
      'resCode': instance.resCode,
      'resIcon': instance.resIcon,
      'resPath': instance.resPath,
      'resName': instance.resName,
      'resSort': instance.resSort,
      'resType': instance.resType,
    };
