import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/tab_search/dataList.dart';
import 'package:hook_up/widget/common_floating_action_button.dart';
import 'package:hook_up/widget/room_list_item_widget.dart';

//房屋管理
class RoomManagePage extends StatelessWidget {
  const RoomManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CommonFloatingActionButton(
              title: '发布房源',
              onTap: () {
                Navigator.of(context).pushNamed('roomAdd');
              }),
          appBar: AppBar(
            title: Text('房屋管理'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [Tab(text: '空置'), Tab(text: '已租')],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: dataList
                    .map((item) => RoomListItemWidget(data: item))
                    .toList(),
              ),
              ListView(
                children: dataList
                    .map((item) => RoomListItemWidget(data: item))
                    .toList(),
              )
            ],
          )),
    );
  }
}
