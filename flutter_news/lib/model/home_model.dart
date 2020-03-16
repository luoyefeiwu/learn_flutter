import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

//这个注解是告诉生成器，这个类需要生成3Model类的
@JsonSerializable()
class HomeModel {
  int code;
  String msg;
  List<HomeData> newslist;

  HomeModel(this.code, this.msg, this.newslist);

  //反序列化,factory *.fromJson(Map<String, dynamic> json) =>_$*FromJson(json)
  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  //序列化,Map<String, dynamic> toJson() => _$*ToJson(this);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class HomeData {
  String ctime;
  String title;
  String description;
  String picUrl;
  String url;

  HomeData(this.ctime, this.title, this.description, this.picUrl, this.url);
  //反序列化,factory *.fromJson(Map<String, dynamic> json) =>_$*FromJson(json)
  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);
  //序列化,Map<String, dynamic> toJson() => _$*ToJson(this);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
