import 'dart:ffi';

import '../models/pack/PackProductInfo.dart';
import '../models/pack/PrintPackageInfo.dart';
import '../models/receive/CrossStorageScanInfo.dart';
import '../models/receive/WaitScanList.dart';
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

  /// 获取待打包清单
  /// {"code":"XS0325121840211X.CG251218121151.1001901","operateConfigModelCode":"scan_store_goods_container_goods_reprint","warehouseCode":"HZC02"}
  Future<ApiResult<WaitScanList>> packageScan(Map<String, dynamic> map) async {
    var result = await _api.post<WaitScanList>(
      '/dtwmsApi/packageManage/packageScan',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return WaitScanList.fromJson(map);
      },
    );
    return result;
  }

  /// 获取零件信息
  /// {"code":"XS0325121840211X.CG251218121151.1001901","operateConfigModelCode":"scan_store_goods_container_goods_reprint","warehouseCode":"HZC02","taskNum":"XS0325121840211X.CG251218121151.1001901"}
  Future<ApiResult<PackProductInfo>> packageScanProduct(
    Map<String, dynamic> map,
  ) async {
    var result = await _api.post<PackProductInfo>(
      '/dtwmsApi/packageManage/packageScanProduct',
      data: map,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return PackProductInfo.fromJson(map);
      },
    );
    return result;
  }

  /// 打印包裹
  Future<ApiResult<PrintPackageInfo>> printPackage(List list) async {
    var result = await _api.post<PrintPackageInfo>(
      '/dtwmsApi/packageManage/printPackage',
      data: list,
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return PrintPackageInfo.fromJson(map);
      },
    );
    return result;
  }
}
