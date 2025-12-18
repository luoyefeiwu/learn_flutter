import 'dart:convert';

import 'package:wms/service/api_client.dart';

import '../models/ReceiveConfig.dart';
import '../models/Warehouse.dart';
import '../utils/ApiResult.dart';
import '../utils/TokenManager.dart';

class WarehouseService {
  final ApiClient _api = ApiClient();

  /// 仓库列表
  Future<ApiResult<List<Warehouse>>> listWarehouseByUser() async {
    var result = await _api.post<List<Warehouse>>(
      '/dtwmsApi/warehouseManagement/listWarehouseByUser',
      data: {},
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <Warehouse>[];
        }
      },
    );
    return result;
  }

  /// 收货操作配置
  Future<ApiResult<List<ReceiveConfig>>> getTakeDeliveryOfGoodsOperateConfig() async {
    var warehouseCode = "HZC02";
    var result = await _api.post<List<ReceiveConfig>>(
      '/dtwmsApi/operateConfig/getTakeDeliveryOfGoodsOperateConfig?warehouseCode=' +
          warehouseCode,
      data: {},
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => ReceiveConfig.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <ReceiveConfig>[];
        }
      },
    );
    return result;
  }
}
