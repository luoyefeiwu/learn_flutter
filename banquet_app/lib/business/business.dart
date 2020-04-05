import 'package:banquet_app/common/apiModel.dart';
import 'package:banquet_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:banquet_app/common/orderStage.dart';
import '../common/api.dart';

//商机
class Business extends StatefulWidget {
  @override
  _BusinessState createState() => new _BusinessState();
}

class _BusinessState extends State<Business> {
  String date = DateTime.now().toString().split(" ")[0];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "创建商机",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                //点击回调事件 弹出一句提示框
                Scaffold.of(context)
                    .showSnackBar(new SnackBar(content: Text("返回")));
              }),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 192, 147)),
      body: Container(
        child: Column(
          children: <Widget>[
            OrderStage(),
            Container(
              child: _buildBaseInfo(),
              color: Colors.white,
            ),
            Container(
              child: _buildLinkman(),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(width: 2, color: Colors.green),
                      bottom: BorderSide(width: 2, color: Colors.green))),
            ),
            RaisedButton(
              child: Text("点击"),
              onPressed: () {
//                var data = Api().listReceiver();
//                data.then<ApiResponse<List<User>>>((val) {
//                  for (var item in val.data) {
//                    print(item.toJson());
//                  }
//                });
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3.0),
                              boxShadow: [
                                //阴影
                                BoxShadow(
                                  color: Colors.black12,
                                  //offset: Offset(2.0,2.0),
                                  blurRadius: 10.0,
                                )
                              ]),
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(16),
                          constraints:
                              BoxConstraints(minHeight: 120, minWidth: 180),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  "点击",
                                  style: Theme.of(context).textTheme.body2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )
//            _buildLabel()
          ],
        ),
      ),
    );
  }

  //  构建基本信息
  Widget _buildBaseInfo() {
    //宴会时间
    var _controllerDate = TextEditingController(text: this.date);
    //接单人
    var _controllerOrderer = TextEditingController(text: "钻石老三");
    //分配跟单
    var _controllerSingle = TextEditingController(text: "钻石老三");
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/star.png",
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    "宴会时间",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              //margin: EdgeInsets.only(left: 10),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.orange))),
                    controller: _controllerDate,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime(2099, 12, 31))
                          .then((DateTime val) {
                        this.date = val.toString().split(" ")[0];
                        _controllerDate.value =
                            TextEditingValue(text: this.date);
                      });
                    },
                    readOnly: true,
                  )),
                  Image.asset(
                    "images/down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/star.png",
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    "接单人",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.orange))),
                    controller: _controllerOrderer,
                    onTap: () {},
                    readOnly: true,
                  )),
                  Image.asset(
                    "images/down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/star.png",
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    "分配跟单",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.orange))),
                    controller: _controllerSingle,
                    onTap: () {},
                    readOnly: true,
                  )),
                  Image.asset(
                    "images/down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/star.png",
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    "宴会类型",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "请选择",
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.orange))),
                    //controller: _controllerSingle,
                    onTap: () {},
                    readOnly: true,
                  )),
                  Image.asset(
                    "images/down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
//                  Image.asset(
//                    "images/star.png",
//                    width: 10,
//                    height: 10,
//                  ),
                  Text(
                    "分配策划人",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "请选择",
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.orange))),
                    //controller: _controllerSingle,
                    onTap: () {},
                    readOnly: true,
                  )),
                  Image.asset(
                    "images/down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    "宴会水牌",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "请选择",
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.orange))),
                    //controller: _controllerSingle,
                    onTap: () {},
                    readOnly: true,
                  )),
                  Image.asset(
                    "images/down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        )
      ],
    );
  }

  //宾客
  Widget _buildLinkman() {
    return Row(
      //mainAxisAlignment = MainAxisAlignment.start
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "images/star.png",
          width: 10,
          height: 10,
        ),
        Text(
          "宾客",
          style: TextStyle(fontSize: 14),
        ),
        Container(
          child: Text(
            "添加",
            style: TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 0, 192, 147)),
          ),
          margin: EdgeInsets.only(left: 300),
        ),
        Container(
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 0, 192, 147),
          ),
          margin: EdgeInsets.only(right: 5),
        )
      ],
    );
  }

  Widget _buildLabel() {}
}
