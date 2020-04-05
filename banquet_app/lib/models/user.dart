import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    String channelid;
    String restaurantid;
    String restaurantname;
    String externalchannelid;
    String externalchannelname;
    num isexternalchannel;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
