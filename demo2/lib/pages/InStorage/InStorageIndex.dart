import 'package:demo2/r.dart';
import 'package:flutter/material.dart';

class InStorageIndex extends StatefulWidget {
  const InStorageIndex({super.key});

  @override
  State<InStorageIndex> createState() => _IndexState();
}

class _IndexState extends State<InStorageIndex> {
  List _list = [
    {'title': '收货', 'routeName': '/index'},
    {'title': '质检', 'routeName': '/index'},
    {'title': '退货初检', 'routeName': '/index'},
    {'title': '待检判定', 'routeName': '/index'},
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
                  "入库",
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
                              content: Text("你点击了"+_list[i]['title']),
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
