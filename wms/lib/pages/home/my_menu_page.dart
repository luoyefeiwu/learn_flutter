import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/utils/HomeJumpIconUtils.dart';

import '../../models/MyMenu.dart';
import '../../router/routes.dart';
import '../../service/auth_service.dart';
import '../../utils/ApiResult.dart';

class MyMenuPage extends StatefulWidget {
  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
  AuthService authService = AuthService();

  List<MyMenu> list = [];

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

  void _loadData() async {
    ApiResult<List<MyMenu>> result = await authService.myMenu();
    if (result.isSuccess) {
      setState(() {
        list = result.data!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(children: _buildItem()),
    );
  }

  List<Widget> _buildItem() {
    return list.map((item) => _buildItemTitle(item)).toList();
  }

  Widget _buildItemTitle(MyMenu item) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.resName,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          _buildItemContent(item),
        ],
      ),
    );
  }

  Widget _buildItemContent(MyMenu myMenu) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 14.0,
      children: [
        for (var item in myMenu.children!) ...[
          GestureDetector(
            onTap: () {
              var jumpRouteIcon = HomeJumpIconUtils.getJumpRouteIcon(
                item.resCode,
              );
              if (jumpRouteIcon.routeKey != null &&
                  jumpRouteIcon.routeKey!.isNotEmpty) {
                context.push(jumpRouteIcon.routeKey);
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                children: [
                  Icon(
                    HomeJumpIconUtils.getJumpRouteIcon(item.resCode).iconData,
                    color: HomeJumpIconUtils.getJumpRouteIcon(
                      item.resCode,
                    ).color,
                    size: 35.0,
                  ),
                  Text(item.resName),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
