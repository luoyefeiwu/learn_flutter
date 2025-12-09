import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/tab_search/dataList.dart';
import 'package:hook_up/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:hook_up/pages/home/tab_search/filter_bar/index.dart';
import 'package:hook_up/widget/room_list_item_widget.dart';
import 'package:hook_up/widget/search_bar/index.dart' as custom_search;

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [Container()],
        elevation: 0,
        title: custom_search.SearchBar(
          showLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(height: 41.0, child: FilterBar(onChange: (data) {})),
          Expanded(
            child: ListView(
              children: dataList
                  .map((item) => RoomListItemWidget(data: item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
