import 'dart:io';
import 'package:flutter_news/base/base.dart';
import 'dart:convert';

class NetManager {
  Future<String> queryHomeDate(int page) async {
    var httpClient = HttpClient();
    var uri = Uri.http(URL_DOMAIN, URL_HOME_DATA_PATH,
        {"key": URL_KEY, "num": "10", "page": "$page"});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return responseBody;
  }
}
