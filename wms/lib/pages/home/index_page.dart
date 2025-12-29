import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/router/routes.dart';
import 'package:wms/utils/TokenManager.dart';

import '../../config/cache_key.dart';
import '../../models/Warehouse.dart';
import '../../service/warehouse_service.dart';

class IndexPage extends StatefulWidget {
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  WarehouseService warehouseService = WarehouseService();

  List<Warehouse> list = [];

  //选中的仓库编码
  String? _selectedwarehouseCode = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final GoRouterState? routerState = GoRouterState.of(context);
    final extra = routerState?.extra as Map<String, dynamic>?;
    if (extra?['refresh'] == true) {
      // 延迟一点确保页面已构建（可选）
      Future.microtask(() {
        _loadData(); // 重新加载
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('请选择仓库', style: TextStyle(fontSize: 16.0)),
        centerTitle: false,
        backgroundColor: Colors.grey[100],
      ),
      body: ListView(children: list.map((item) => _buildItem(item)).toList()),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 40, 97, 189),
          ),
          onPressed: () {
            //设置缓存
            var warehouseInfo = list
                .where((item) => item.warehouseCode == _selectedwarehouseCode)
                .first;
            TokenManager.saveCache(
              CacheKey.warehouseInfo,
              jsonEncode(warehouseInfo),
            );
            context.push(Routes.home, extra: {'refresh': true});
          },
          child: Text(
            '确定',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildItem(Warehouse item) {
    return Container(
      child: RadioListTile(
        visualDensity: VisualDensity(
          horizontal: -4, // 负值：更紧凑；正值：更宽松（默认为 0）
        ),
        dense: true,
        //contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: Transform.translate(
          offset: Offset(-10, 0),
          child: Text(item.warehouseName, style: TextStyle(fontSize: 18.0)),
        ),
        groupValue: _selectedwarehouseCode,
        onChanged: (value) {
          setState(() {
            _selectedwarehouseCode = value;
          });
        },
        value: item.warehouseCode,
      ),
    );
  }

  void _loadData() async {
    var result = await warehouseService.listWarehouseByUser();
    if (result.isSuccess) {
      setState(() {
        list = result.data!;
        if (list.isNotEmpty) {
          _selectedwarehouseCode = list.first.warehouseCode;
        }
      });
    }
  }
}
