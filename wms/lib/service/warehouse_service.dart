import 'dart:convert';

import 'package:wms/service/api_client.dart';

import '../models/Warehouse.dart';
import '../utils/ApiResult.dart';

class WarehouseService {
  final ApiClient _api = ApiClient();

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
}
