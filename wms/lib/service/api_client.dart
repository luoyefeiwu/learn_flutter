import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wms/config/Config.dart';
import 'package:wms/config/cache_key.dart';
import 'package:wms/utils/ApiResult.dart';
import 'package:wms/utils/TokenManager.dart';

import '../router/app_router.dart';

class ApiClient {
  // 私有的命名构造函数
  ApiClient._internal() {
    // 基础配置
    _dio.options.baseUrl = "https://fatapi.dingteng.tech/";
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
            _handleUnauthorized();
            Fluttertoast.showToast(msg: '登录已过期，请重新登录');
          }
          if (response.data['code'] != 200 && response.data['code'] != 0) {
            Fluttertoast.showToast(
              msg: response.data['msg'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black12,
              textColor: Colors.white,
              fontSize: 16.0,
            );
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

  /// 处理登录失效逻辑
  static void _handleUnauthorized() {
    // 1. 清除本地登录状态（如 token、用户信息）
    TokenManager.removeToken();

    // 2. 跳转到登录页，并清空路由栈（避免返回原页面）
    // 方式1：使用 go 并替换整个路由栈（推荐）
    appRouter.goNamed(
      'login',
      // 可选：传递参数（比如跳转前的页面地址，登录后回跳）
      // extra: {'from': appRouter.location},
    );

    // 方式2：使用 replace 替换当前路由（如果需要保留部分栈，可使用 pushReplacement）
    // appRouter.replaceNamed(AppRoute.login.name);

    // 方式3：清空路由栈后跳转（适用于复杂场景）
    // appRouter.pushReplacementNamed(AppRoute.login.name);
    // 或
    // appRouter.navigate('/login');
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

  void switchBaseUrl(String newBaseUrl) {
    _dio.close();
    if (!newBaseUrl.endsWith('/')) {
      newBaseUrl += '/'; // 自动补全 /
    }
    _dio.options.baseUrl = newBaseUrl;
  }

  Future<void> setBaseUrl() async {
    var cache = await TokenManager.getCache(CacheKey.baseUrl);
    if (cache != null && cache != '') {
      switchBaseUrl(cache);
    }
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
