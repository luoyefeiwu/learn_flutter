import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

import '../models/common/UploadRespon.dart';
import '../utils/ApiResult.dart';
import 'api_client.dart';

class CommonService {
  final ApiClient _api = ApiClient();

  /// 上传图片
  Future<ApiResult<UploadRespon>> uploadImage(File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: path.basename(file.path),
      ),
    });

    var result = await _api.post<UploadRespon>(
      '/basicApi/file/upload/images',
      data: formData,
      options: Options(contentType: Headers.multipartFormDataContentType),
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return UploadRespon.fromJson(map);
      },
    );
    return result;
  }
}
