import '../models/ReceiveConfig.dart';
import '../models/receive/CrossStorageResponse.dart';
import '../utils/ApiResult.dart';
import 'api_client.dart';

class ReceiveService {
  final ApiClient _api = ApiClient();

  /// 获取扫码信息
  Future<ApiResult<CrossStorageResponse>> crossScanCode(
    Map<String, dynamic> map,
  ) async {
    var result = await _api.post<CrossStorageResponse>(
      '/dtwmsApi/cross/scanCode',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return CrossStorageResponse.fromJson(map);
      },
    );
    return result;
  }
}
