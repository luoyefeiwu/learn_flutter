import 'package:flutter/material.dart';

class NearCompany extends StatefulWidget {
  @override
  State createState() => _NearCompanyStatus();
}

class _NearCompanyStatus extends State<NearCompany> {
  //查询条件
  Widget _search() {
    return Container(
      child: Row(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
          ),
          Text("取消")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("附近的责任单位"),
        leading: Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.arrow_back_ios,
                size: 20.0,
              ),
              Text("返回")
            ],
          ),
        ),
        actions: <Widget>[
          Text(
            "...",
            style: TextStyle(
              fontSize: 25.0,
            ),
          )
        ],
      ),
      body: _search(),
    );
  }
}
