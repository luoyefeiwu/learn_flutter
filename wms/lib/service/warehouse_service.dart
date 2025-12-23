import 'package:wms/service/api_client.dart';

import '../models/Project.dart';
import '../models/ProjectDetail.dart';
import '../models/ReceiveConfig.dart';
import '../models/Warehouse.dart';
import '../utils/ApiResult.dart';

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
  Future<ApiResult<List<ReceiveConfig>>>
  getTakeDeliveryOfGoodsOperateConfig() async {
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

  /// 获取流水线环境
  Future<ApiResult<List<ProjectItem>>> projectList() async {
    var result = await _api.post<List<ProjectItem>>(
      '/aaronApi/project/projectList',
      data: {"page": 1, "pageSize": 100, "showActive": 1},
      fromJson: (json) {
        if (json == null) return <ProjectItem>[];
        final map = json as Map<String, dynamic>;
        final project = Project.fromJson(map);
        return project?.list ?? <ProjectItem>[];
      },
    );
    return result;
  }

  /// 获取流水线详情
  Future<ApiResult<ProjectDetail>> projectDetail(String projectCode) async {
    var result = await _api.post<ProjectDetail>(
      '/aaronApi/project/projectDetail',
      data: {"code": projectCode},
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return ProjectDetail.fromJson(map);
      },
    );
    return result;
  }
}
