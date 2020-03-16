import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryViewState();
  }
}

class _CategoryViewState extends State<CategoryView> {
  //所有分类
  List<String> _categorys = [
    "综合新闻",
    "新闻汽车",
    "国内新闻",
    "动漫新闻",
    "财经新闻",
    "游戏新闻",
    "国际新闻",
    "人工智能",
    "军事新闻",
    "体育新闻"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _getItem(context, index);
        },
        itemCount: _categorys.length ~/ 2,
      ),
    );
  }

  //进行布局
  Widget _getItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                _categorys[index * 2],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            width: MediaQuery.of(context).size.width / 2,
            color: index % 2 == 0 ? Colors.orange : Colors.blueAccent,
            height: 130,
          ),
          Container(
            child: Center(
              child: Text(
                _categorys[index * 2 + 1],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            width: MediaQuery.of(context).size.width / 2,
            color: index % 2 == 0 ? Colors.blueAccent : Colors.orange,
            height: 130,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 130,
    );
  }
}
