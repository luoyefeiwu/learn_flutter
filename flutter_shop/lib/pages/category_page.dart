import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../models/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  // final Widget child;

  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
          ],
        ),
      ),
    );
  }
}

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNav createState() => _LeftCategoryNav();
}

class _LeftCategoryNav extends State<LeftCategoryNav> {
  List list = [];

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  Widget _leftInkWell(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
          color: Colors.white,
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  void _getCategory() {
    getRequest('getCategory').then((data) {
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Container(
        width: ScreenUtil().setWidth(180),
        decoration: BoxDecoration(
            border: Border(
          right: BorderSide(width: 1, color: Colors.black12),
        )),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _leftInkWell(index);
          },
          itemCount: list.length,
        ));
  }
}
