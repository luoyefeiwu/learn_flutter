import 'package:flutter/material.dart';

class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem('整租', 'https://res.5i5j.com/wap/site/images/nav_zf.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('合租', 'https://res.5i5j.com/wap/site/images/nav_xy.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('地图找房', 'https://res.5i5j.com/wap/site/images/nav_xf.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('去出租', 'https://res.5i5j.com/wap/site/images/nav_zf.png', (context) {
    Navigator.of(context).pushNamed('login');
  }),
];
