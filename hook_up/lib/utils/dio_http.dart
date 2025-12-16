import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hook_up/config/Config.dart';

class DioHttp {
  late Dio _client;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
        baseUrl: Config.BaseUrl,
        connectTimeout: Duration(milliseconds: 10000),
        receiveTimeout: Duration(milliseconds: 10000),
        extra: {"context": context},
      );
      _client = Dio(options);
    }
  }

  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    var options = Options(headers: {"Authorization": token ?? ""});

    return await _client.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic>? params,
    String? token,
  }) async {
    var options = Options(
      contentType: "application/json",
      headers: {"Authorization": token ?? ""},
    );

    return await _client.post(path, data: params, options: options);
  }
}
