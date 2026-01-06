import '../models/print/PrintConfig.dart';
import '../models/print/PrintPackageData.dart';
import '../utils/ApiResult.dart';
import 'api_client.dart';

class PrintService {
  final ApiClient _api = ApiClient();

  ///打印包裹 {"packageCoSourcingNo":"BGHZC0220260106000002","warehouseCode":"HZC02","source":2}
  Future<ApiResult<PrintPackageData>> printWrapSheet(Map map) async {
    var result = await _api.post<PrintPackageData>(
      '/dtwmsApi/printData/printWrapSheet',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return PrintPackageData.fromJson(map);
      },
    );
    return result;
  }

  ///设备管理  {"qspUserId":169724,"appCode":"TMS","sceneCode":null}
  Future<ApiResult<List<PrintConfig>>> findMyPrintConfig(Map map) async {
    var result = await _api.post<List<PrintConfig>>(
      '/basicApi/print/config/myPrintConfigList',
      data: map,
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => PrintConfig.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <PrintConfig>[];
        }
      },
    );
    return result;
  }

  ///设备管理  {"qspUserId":169724,"appCode":"TMS","sceneCode":null}
  Future<ApiResult<List<PrintConfig>>> printShippingManifest(Map map) async {
    var result = await _api.post<List<PrintConfig>>(
      '/frontApi/order/query/printShippingManifest',
      data: map,
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => PrintConfig.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <PrintConfig>[];
        }
      },
    );
    return result;
  }
}
