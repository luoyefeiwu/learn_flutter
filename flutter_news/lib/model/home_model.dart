import 'package:json_annotation/json_annotation.dart';

//part 'home_model.g.dart';

//这个注解是告诉生成器，这个类需要生成Model类的
@JsonSerializable()
class HomeModel {
  int code;
  String msg;
  List<HomeData> newslist;

  HomeModel(this.code, this.msg, this.newslist);

//  factory HomeModel.fromJson(Map<String, dynamic> json) =>
//      _$HomeModelFromJson(json);
//
//  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class HomeData {
  String ctime;
  String title;
  String description;
  String picUri;
  String url;
}
