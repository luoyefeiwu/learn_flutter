import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up/widget/common_title.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var selectIds = ['11'];
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            CommonTitle(title: '户型'),
            FilterDrawerItem(
              list: roomTypeList,
              selectedId: selectIds,
              onChange: (id) {},
            ),
            CommonTitle(title: '朝向'),
            FilterDrawerItem(
              list: orientedList,
              selectedId: selectIds,
              onChange: (id) {},
            ),
            CommonTitle(title: '楼层'),
            FilterDrawerItem(
              list: floorList,
              selectedId: selectIds,
              onChange: (id) {},
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedId;
  final ValueChanged<String> onChange;

  const FilterDrawerItem({
    super.key,
    required this.list,
    required this.selectedId,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map((item) {
          var isActive = selectedId.contains(item.id);
          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange(item.id);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100.0,
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.green),
                color: isActive ? Colors.green : Colors.white,
              ),
              child: Center(
                child: Text(
                  item.name,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
