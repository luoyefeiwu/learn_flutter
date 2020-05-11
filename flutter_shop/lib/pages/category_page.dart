import 'package:flutter/material.dart';
import '../service/service_method.dart';

class CategoryPage extends StatefulWidget {
  // final Widget child;

  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('分类页面'),
      ),
    );
  }

  void _getCategory() async {
    await getRequest("getCategory").then((data) {});
  }
}
