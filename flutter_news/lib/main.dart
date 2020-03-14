import 'package:flutter/material.dart';
import 'package:flutter_news/home/home_view.dart';
import 'package:flutter_news/category/category_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _containerView();
  }

  Widget _containerView() {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text(
                  "热门",
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  "分类",
                  style: TextStyle(color: Colors.black),
                ))
              ],
              indicatorColor: Colors.green,
            ),
            title: Text(
              "新闻资讯",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(children: [HomeView(), CategoryView()]),
        ),
      ),
    );
  }
}
