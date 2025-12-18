import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/r.dart';

import '../../models/ReceiveConfig.dart';
import '../../router/routes.dart';
import '../../service/warehouse_service.dart';

class ReceiveConfigPage extends StatefulWidget {
  const ReceiveConfigPage({super.key});

  @override
  State<ReceiveConfigPage> createState() => _ReceiveConfigPageState();
}

class _ReceiveConfigPageState extends State<ReceiveConfigPage> {
  WarehouseService warehouseService = WarehouseService();

  List<ReceiveConfig> list = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('收货'),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
      ),
      body: ListView(children: list.map((item) => _buildItem(item)).toList()),
    );
  }

  Widget _buildItem(ReceiveConfig item) {
    return GestureDetector(
      onTap: () {
        if (item.operateModelCode == 'yk') {
          context.push(Routes.receiveCross);
        }
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              item.operateModelCode == 'yk'
                  ? R.assetsImgYueku
                  : R.assetsImgChanggui,
              height: 120.0,
            ),
            Text(
              item.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  void _loadData() async {
    var result = await warehouseService.getTakeDeliveryOfGoodsOperateConfig();
    if (result.isSuccess) {
      setState(() {
        list = result.data!;
      });
    }
  }
}
