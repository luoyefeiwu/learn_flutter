import 'package:demo2/model/MyMenu.dart';
import 'package:demo2/pages/InStorage/InStorageIndex.dart';
import 'package:flutter/material.dart';

import '../../config/Api.dart';
import '../Inventory/InventoryIndex.dart';
import '../outStorage/OutStorageIndex.dart';

class Index extends StatefulWidget {
  const Index({super.key, required this.title});

  final String title;

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  //记录当前tabbar点击的下标
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: getBackage(context),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        //tabbar的点击事件
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        //设置图标尺寸
        iconSize: 30,
        //设置选中图标的颜色
        fixedColor: Colors.blue,
        //设置item
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "应用"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }

  Widget getBackage(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height -80,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 0),
        ),
        child: const Column(
          children: [
            InStorageIndex(),
            InventoryIndex(),
            Expanded(child: OutStorageIndex()),
          ],
        ));
  }
}
