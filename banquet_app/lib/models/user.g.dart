// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..channelid = json['channelid'] as String
    ..restaurantid = json['restaurantid'] as String
    ..restaurantname = json['restaurantname'] as String
    ..externalchannelid = json['externalchannelid'] as String
    ..externalchannelname = json['externalchannelname'] as String
    ..isexternalchannel = json['isexternalchannel'] as num;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'channelid': instance.channelid,
      'restaurantid': instance.restaurantid,
      'restaurantname': instance.restaurantname,
      'externalchannelid': instance.externalchannelid,
      'externalchannelname': instance.externalchannelname,
      'isexternalchannel': instance.isexternalchannel
    };
