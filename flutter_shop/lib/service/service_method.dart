import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//获取首页主体内容
Future getHomePageContent() async {
  try {
    print("开始获取首页数据");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencode");
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.get(servicePath['homePageContext']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常.');
    }
  } catch (e) {
    return print('ERROR:========>${e}');
  }
}

//获取首页主体内容
Future homePageBelowten() async {
  try {
    print("开始获取火爆专区数据");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencode");
    int page = 1;
    response = await dio.get(servicePath['homePageBelowten']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常.');
    }
  } catch (e) {
    return print('ERROR:========>${e}');
  }
}

Future getRequest(url) async {
  try {
    print('请求.....');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencode");
    int page = 1;
    response = await dio.get(servicePath[url]);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常.');
    }
  } catch (e) {
    return print('ERROR:========>${e}');
  }
}
