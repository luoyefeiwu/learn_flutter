import 'dart:ffi';

import '../models/receive/CrossStorageScanInfo.dart';
import '../utils/ApiResult.dart';
import 'api_client.dart';

class ReceiveService {
  final ApiClient _api = ApiClient();

  /// 获取扫码信息
  Future<ApiResult<CrossStorageScanInfo>> crossScanCode(
    Map<String, dynamic> map,
  ) async {
    var result = await _api.post<CrossStorageScanInfo>(
      '/dtwmsApi/cross/scanCode',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return CrossStorageScanInfo.fromJson(map);
      },
    );
    return result;
  }

  /// 越库收货
  Future<ApiResult<bool>> crossCommit(List list) async {
    var result = await _api.post<bool>(
      '/dtwmsApi/cross/commit',
      data: list,
      fromJson: (json) {
        if (json is Map<String, dynamic>) {
          // 根据实际 API 文档调整字段名
          final data = json['data'];
          if (data is bool) {
            return data;
          }
          // 如果 data 是其他类型，根据业务逻辑转换
          return json['code'] == 200 || json['code'] == 0;
        }
        return false;
      },
    );
    return result;
  }
}
