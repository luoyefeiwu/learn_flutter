import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:banquet_app/models/index.dart';
import '../common/apiModel.dart';

class Api {
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'http://yh_interface.shengyan.com.cn/',
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.cookieHeader:
          'Token=%2fcOIDypFeRbLrlD7%2ffh5Kzz0iWZ6jydbLRGfUNhLKn206nndhMtwSl3X0BBOJ0T7W7G5QopfYnEL6%2f1aO5qJFg%3d%3d'
    },
  ));

  //获取人员信息
  Future<ApiResponse<List<User>>> listReceiver() async {
    var r = await dio.get("user/listReceiver");
    var model = ApiResponse<List<User>>();
    List<User> list = List<User>();
    r.data["data"].forEach((f) => list.add(new User.fromJson(f)));
    model.returncode = r.data["returncode"];
    model.data = list;
    model.size = r.data["size"];
    model.message = r.data["message"];
    model.remark = r.data["remark"];
    return model;
  }
}
