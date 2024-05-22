// 这里是一个我单独写得soket错误实例，因为dio默认生成的是不允许修改message内容的，我只能自定义一个使用
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class MyDioSocketException extends SocketException {
  late String message;

  MyDioSocketException(
    message, {
    osError,
    address,
    port,
  }) : super(
          message,
          osError: osError,
          address: address,
          port: port,
        );
}

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  // 是否有网
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler errCb) async {
    // 自定义一个socket实例，因为dio原生的实例，message属于是只读的
    // 这里是我单独加的，因为默认的dio err实例，的几种类型，缺少无网络情况下的错误提示信息
    // 这里我手动做处理，来加工一手，效果，看下面的图片，你就知道
    // if (err.error is SocketException) {
    //   err.error = MyDioSocketException(
    //     err.message,
    //     osError: err.error?.osError,
    //     address: err.error?.address,
    //     port: err.error?.port,
    //   );
    // }
    // // dio默认的错误实例，如果是没有网络，只能得到一个未知错误，无法精准的得知是否是无网络的情况
    // if (err.type == DioErrorType.other) {
    //   bool isConnectNetWork = await isConnected();
    //   if (!isConnectNetWork && err.error is MyDioSocketException) {
    //     err.error.message = "当前网络不可用，请检查您的网络";
    //   }
    // }
    // // error统一处理
    // AppException appException = AppException.create(err);
    // // 错误提示
    // debugPrint('DioError===: ${appException.toString()}');
    // err.error = appException;
    return super.onError(err, errCb);
  }
}
