import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/dataList.dart';
import 'package:hook_up_rent/widget/room_list_item_widget.dart';
import 'package:hook_up_rent/widget/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: SearchBar(
      showLocation: true,
      showMap: true,
      onSearch: (){
        Navigator.of(context).pushNamed('search');
      },
    ),
    backgroundColor: Colors.white,
    ),
      body: Column(
        children: [
          Container(
            height: 40.0,
            child: Text('filterBar'),
          ),
          Expanded(
              child: ListView(
            children: dataList
                .map((item) => RoomListItemWidget(
                      data: item,
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}
