import 'package:demo2/r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutStorageIndex extends StatefulWidget {
  const OutStorageIndex({super.key});

  @override
  State<OutStorageIndex> createState() => _OutStorageIndexState();
}

class _OutStorageIndexState extends State<OutStorageIndex> {
  List _list = [
    {'title': '释放容器', 'routeName': '/free'},
    {'title': '退出登录', 'routeName': '/login'}
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
                  "出库",
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
                        Navigator.pushNamed(context, _list[i]['routeName']);
                      });
                },
                itemCount: _list.length,
                shrinkWrap: true,
              ),
            )
          ],
        ));
  }
}
