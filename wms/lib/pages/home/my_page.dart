import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wms/utils/TokenManager.dart';

import '../../models/UserInfo.dart';
import '../../models/Warehouse.dart';
import '../../router/routes.dart';
import '../../utils/WarehouseUtils.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Warehouse? warehouse;
  UserInfo? userInfo;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('我的'),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      // ),
      body: ListView(
        children: [
          // 👤 用户信息区
          _buildUserInfo(context),
          // 🔧 功能列表
          ..._buildMenuItems(context),
          // const SizedBox(height: 40),
          // 🚪 退出登录
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                _showLogoutDialog(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text('退出登录'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade500,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // 用户信息卡片
  Widget _buildUserInfo(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 70),
            // backgroundImage: const NetworkImage(
            //   'https://via.placeholder.com/150', // 替换为真实头像 URL
            // ),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfo?.realName ?? "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  softWrap: true,
                  maxLines: 2,
                  userInfo?.roles != null
                      ? userInfo!.roles!.map((item) => item.roleName).join(',')
                      : "",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                // const SizedBox(height: 4),
                // const SizedBox(height: 8),
                // OutlinedButton(
                //   onPressed: () {
                //     // 跳转到编辑资料页
                //     ScaffoldMessenger.of(
                //       context,
                //     ).showSnackBar(const SnackBar(content: Text('跳转到编辑资料')));
                //   },
                //   style: OutlinedButton.styleFrom(
                //     side: BorderSide(color: Colors.blue.shade300),
                //     foregroundColor: Colors.blue.shade700,
                //   ),
                //   child: const Text('编辑资料'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 功能菜单项
  List<Widget> _buildMenuItems(BuildContext context) {
    final items = [
      {'icon': Icons.person, 'title': '当前仓库', 'onTap': () {}, 'type': 1},
      {'icon': Icons.lock, 'title': '设备管理', 'onTap': () {}, 'type': 2},
      {'icon': Icons.notifications, 'title': '修改密码', 'onTap': () {}, 'type': 3},
      {'icon': Icons.payment, 'title': '我的二维码', 'onTap': () {}, 'type': 4},
      {'icon': Icons.language, 'title': '版本更新', 'onTap': () {}, 'type': 5},
      {'icon': Icons.dark_mode, 'title': '清楚缓存', 'onTap': () {}, 'type': 6},
      {'icon': Icons.help, 'title': '环境切换', 'onTap': () {}, 'type': 7},
      {'icon': Icons.info, 'title': '关于我们', 'onTap': () {}, 'type': 8},
    ];

    return items.map((item) {
      return ListTile(
        leading: Icon(item['icon'] as IconData),
        title: Text(item['title'] as String),
        trailing: item['type'] == 1
            ? Text(
                warehouse == null ? "" : warehouse!.warehouseName,
                style: TextStyle(fontSize: 20),
              )
            : const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: item['onTap'] as void Function(),
      );
    }).toList();
  }

  // 退出登录弹窗
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('确认退出？'),
        content: const Text('您将退出当前账号，是否继续？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              await TokenManager.removeToken();
              context.go(Routes.login);
              // 执行退出逻辑（清 token、跳转登录页等）
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('已退出登录')));
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _loadData() async {
    var result = await WarehouseUtils.getWarehouseInfo();
    var user = await WarehouseUtils.getUserInfo();
    setState(() {
      warehouse = result!;
      userInfo = user;
    });
  }
}
