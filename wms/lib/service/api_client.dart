import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wms/config/Config.dart';
import 'package:wms/utils/ApiResult.dart';
import 'package:wms/utils/TokenManager.dart';

class ApiClient {
  // 私有的命名构造函数
  ApiClient._internal() {
    // 基础配置
    _dio.options.baseUrl = 'https://fatapi.dingteng.tech';
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);

    // 添加拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!Config.whiteList.contains(options.path)) {
            // 添加 Token（从本地存储获取，示例用变量代替）
            final token = await _getToken();
            if (token != null) {
              options.headers['dt_sessionId'] = token;
            }
          }
          options.headers['appcode'] = 'new_wms_app';
          options.headers['appType'] = '3';
          options.headers['appVersion'] = '1.7.2';
          if (kDebugMode) {
            print(
              '【请求】${options.method} ${options.path} | headers: ${options.headers}',
            );
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('【响应】${response.statusCode} ${response.data}');
          }
          if (response.data['code'] == 501) {
            TokenManager.removeToken();
            Fluttertoast.showToast(msg: '登录已过期，请重新登录');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          _handleError(e);
          return handler.reject(e);
        },
      ),
    );
  }

  // 静态实例
  static final ApiClient _instance = ApiClient._internal();

  // 工厂构造函数
  factory ApiClient() => _instance;

  final Dio _dio = Dio();

  // 模拟从本地获取 token（实际可用 shared_preferences 或 secure_storage）
  Future<String?> _getToken() async {
    return await TokenManager.getToken();
  }

  // 统一错误处理
  void _handleError(DioException e) {
    String message = '网络请求失败';
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 401:
          message = '登录已过期，请重新登录';
          // TODO: 跳转到登录页
          break;
        case 403:
          message = '没有权限访问';
          break;
        case 404:
          message = '请求地址不存在';
          break;
        case 500:
          message = '服务器内部错误';
          break;
        default:
          message = e.response?.statusMessage ?? '未知错误';
      }
    } else if (e.type == DioExceptionType.connectionTimeout) {
      message = '连接超时';
    } else if (e.type == DioExceptionType.sendTimeout) {
      message = '请求超时';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      message = '响应超时';
    } else if (e.type == DioExceptionType.cancel) {
      message = '请求被取消';
    } else {
      message = '网络异常，请检查网络';
    }

    // 全局 Toast 提示（可替换为 SnackBar）
    Fluttertoast.showToast(msg: message);
    debugPrint('【Dio Error】$message');
  }

  // GET 请求
  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJson,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return ApiResult.fromJson(response.data, fromJson ?? (json) => json as T);
  }

  // POST 请求
  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJson,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return ApiResult.fromJson(response.data, fromJson ?? (json) => json as T);
  }

  // // PUT / DELETE 等可按需添加
  // Future<T> put<T>(String path, {dynamic data}) async {
  //   final response = await _dio.put(path, data: data);
  //   return response.data as T;
  // }
  //
  // Future<void> delete(String path) async {
  //   await _dio.delete(path);
  // }
}
