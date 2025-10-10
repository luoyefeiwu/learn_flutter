import 'package:json_annotation/json_annotation.dart';

part 'ApiResponse.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  T? data;
  int? code;
  String? msg;

  ApiResponse({this.data, this.code, this.msg});
}
