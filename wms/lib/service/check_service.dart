import 'package:wms/models/common/CommonModel.dart';

import '../models/check/CheckExecutionCountStatus.dart';
import '../models/check/CrossCheckInfo.dart';
import '../models/check/RepertoryStatus.dart';
import '../utils/ApiResult.dart';
import 'api_client.dart';

class CheckService {
  final ApiClient _api = ApiClient();

  /// 质检扫码
  Future<ApiResult<CrossCheckInfo>> queryScanNoInfo(
    Map<String, dynamic> map,
  ) async {
    var result = await _api.post<CrossCheckInfo>(
      '/dtwmsApi/check/queryScanNoInfo',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return CrossCheckInfo.fromJson(map);
      },
    );
    return result;
  }

  ///获取库存状态
  Future<ApiResult<List<RepertoryStatus>>> queryCheckInventor(
    String warehouseCode,
    int qualifiedStatus,
  ) async {
    var result = await _api.post<List<RepertoryStatus>>(
      '/dtwmsApi/check/queryCheckInventory?warehouseCode=$warehouseCode&qualifiedStatus=$qualifiedStatus',
      //'/dtwmsApi/check/queryCheckInventory?warehouseCode=HZC02&qualifiedStatus=1',
      data: {},
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => RepertoryStatus.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <RepertoryStatus>[];
        }
      },
    );
    return result;
  }

  // 获取质检异常信息
  Future<ApiResult<CheckExecutionCountStatus>> findCheckExection(
    String warehouseCode,
  ) async {
    var result = await _api.post<CheckExecutionCountStatus>(
      '/dtwmsApi/check/findCheckExection?warehouseCode=$warehouseCode',
      data: {},
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return CheckExecutionCountStatus.fromJson(map);
      },
    );
    return result;
  }

  /// 获取放行人
  Future<ApiResult<List<CommonModel>>> findPassUser() async {
    var result = await _api.get<List<CommonModel>>(
      '/dtwmsApi/check/findPassUser',
      queryParameters: {},
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => CommonModel.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <CommonModel>[];
        }
      },
    );
    return result;
  }

  /// 获取放行原因
  Future<ApiResult<List<CommonModel>>> findPassReason() async {
    var result = await _api.get<List<CommonModel>>(
      '/dtwmsApi/check/findPassReason',
      queryParameters: {},
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => CommonModel.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <CommonModel>[];
        }
      },
    );
    return result;
  }
}
