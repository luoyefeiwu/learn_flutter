import 'package:flutter/material.dart';
import 'package:banquet_app/common/orderStage.dart';

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
            _buildBaseInfo(),
//            _buildLinkman(),
//            _buildLabel()
          ],
        ),
      ),
    );
  }

  //  构建基本信息
  Widget _buildBaseInfo() {
    var _controller = TextEditingController(text: this.date);
    return Row(
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
                            style: BorderStyle.none, color: Colors.orange))),
                controller: _controller,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2099, 12, 31))
                      .then((DateTime val) {
                    this.date = val.toString().split(" ")[0];
                    _controller.value = TextEditingValue(text: this.date);
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
    );
  }

  //宾客
  Widget _buildLinkman() {}

  Widget _buildLabel() {}
}
