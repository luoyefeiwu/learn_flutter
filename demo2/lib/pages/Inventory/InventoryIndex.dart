import 'package:demo2/r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoryIndex extends StatefulWidget {
  const InventoryIndex({super.key});

  @override
  State<InventoryIndex> createState() => _InventoryIndexState();
}

class _InventoryIndexState extends State<InventoryIndex> {

  List _list = [
    {'title': '上架', 'routeName': '/index'},
    {'title': '移位', 'routeName': '/index'},
    {'title': '盘点', 'routeName': '/index'},
    {'title': '查库存', 'routeName': '/index'},
    {'title': '库存异常', 'routeName': '/index'},
    {'title': '扫码打标', 'routeName': '/index'},
    {'title': '更换物流包裹', 'routeName': '/index'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: const Text(
                  "库存",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )),
            Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.8,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              R.assetsImagesReceiveGoods,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Text(_list[i]['title']),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("提示"),
                              content:  Text("你点击了"+_list[i]['title']),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () =>
                                        {Navigator.of(context).pop(true)},
                                    child: const Text("确认")),
                                TextButton(
                                    onPressed: () =>
                                        {Navigator.of(context).pop(true)},
                                    child: const Text("取消"))
                              ],
                            );
                          });
                    },
                  );
                },
                itemCount: _list.length,
                shrinkWrap: true,
              ),
            )
          ],
        ));
  }
}
