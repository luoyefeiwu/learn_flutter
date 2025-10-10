import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/Info.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommond.dart';
import 'package:hook_up_rent/widget/common_swipper.dart';
import 'package:hook_up_rent/widget/search_bar/index.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({super.key});

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
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
        body: SafeArea(
          child: ListView(children: const [
            CommonSwiper(),
            IndexNavigator(),
            IndexRecommond(),
            Info(showTitle: true),
            Text('这里是文本区')
          ]),
        ));
  }
}
