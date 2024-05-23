import 'package:demo2/r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/Token.dart';
import '../../config/Api.dart';
import '../../config/HttpUtil.dart';

class FreeContainer extends StatefulWidget {
  const FreeContainer({super.key, required this.title});

  final String title;

  @override
  State<FreeContainer> createState() => _FreeContainerState();
}

class _FreeContainerState extends State<FreeContainer> {
  final TextEditingController _loginNameController = TextEditingController();
  final TextEditingController _passWorldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Image.asset(
                R.assetsImagesHomeIndex,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text("释放容器/任务",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
            Container(
              // margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _loginNameController,
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: _passWorldController,
                      //  obscureText: true,
                      // decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     prefixIcon: Container(
                      //       // width: 10,
                      //       child: const Row(
                      //         children: [
                      //           Icon(Icons.star, color: Colors.red, size: 10),
                      //           Text("容器号")
                      //         ],
                      //       ),
                      //     ),
                      //     suffixIcon: Icon(Icons.remove_red_eye),
                      //     filled: true,
                      //     fillColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: MaterialButton(
                onPressed: () async {
                  String no = _loginNameController.value.text;
                  String warehouseCode = _passWorldController.value.text;

                  Map<String, dynamic>? params = {
                    'no': no,
                    'warehouseCode': warehouseCode
                  };
                  var response = await HttpUtils.get(
                      servicePath["freeContainer"].toString(),
                      params: params);
                  String msg = "操作成功!";
                  if (response['code'] != 200) {
                    msg = response['msg'];
                  }
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:  Text("提示"),
                          content:  Text(msg),
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
                child: Text("确定"),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: double.infinity,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
