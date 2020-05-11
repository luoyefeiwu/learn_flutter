// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category()
    ..code = json['code'] as String
    ..message = json['message'] as String
    ..data = json['data'] as List;
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };
