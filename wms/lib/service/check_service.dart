import 'package:wms/models/common/CommonModel.dart';

import '../models/check/CheckExecutionCountStatus.dart';
import '../models/check/CrossCheckInfo.dart';
import '../models/check/QualityCheckResponse.dart';
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
    var result = await _api.get<CheckExecutionCountStatus>(
      '/dtwmsApi/check/findCheckExection?warehouseCode=$warehouseCode',
      queryParameters: {},
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

  /// 质检提交
  /// {"scanNo":"XS0325112739912Y.CG251127120942.1001901","qualifiedStatus":1,"inventoryStatusCode":"good","remark":"12","unqualifiedReason":"配件破损","warehouseCode":"HZC02","files":["https://dingteng02.oss-cn-hangzhou.aliyuncs.com/javatest/images/oms/1767092532766WXUQWw1mfDqY0fo4b.png"],"recordId":"","id":"","woodenFrame":1,"resourceNumbers":"","num":1,"isEmergency":1,"isWaitCheck":0,"isCollect":1,"isPackage":0,"isCheckSign":0,"isLargeOrderAArea":0,"isLargeOrderBArea":0,"passUserCode":"checkMe","passUserName":"质检本人","otherPassUser":"","passReasonCode":"pass","otherReason":""}
  Future<ApiResult<String>> checkCommit(Map map) async {
    var result = await _api.post<String>('/dtwmsApi/check/commit', data: map);
    return result;
  }

  /// {"warehouseCode":"HZC02","scanNo":"","page":1,"pageSize":20,"followType":0,"processingResultCode":[]}
  Future<ApiResult<QualityCheckResponse>> queryCheckRecord(Map map) async {
    var result = await _api.post<QualityCheckResponse>(
      '/dtwmsApi/check/queryCheckRecord',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return QualityCheckResponse.fromJson(map);
      },
    );
    return result;
  }
}
