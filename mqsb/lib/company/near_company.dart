import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mqsb/model/company.dart';

class NearCompany extends StatefulWidget {
  @override
  State createState() => _NearCompanyStatus();
}

class _NearCompanyStatus extends State<NearCompany> {
  List<Company> list = listCompany;

  TextEditingController _searchController = TextEditingController();

  //查询条件
  Widget _search() {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
            width: ScreenUtil().setWidth(900),
            height: ScreenUtil().setHeight(100),
            child: TextField(
              controller: _searchController,
              onChanged: (v) {
                if (v == "") {
                  list = listCompany;
                } else {
                  list = listCompany
                      .where((element) => element.name.indexOf(v) > -1).toList();
                }
              },
              decoration: InputDecoration(
                hintText: "搜索",
                hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(13), color: Colors.white),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
          ),
          GestureDetector(
            child: Text(
              "取消",
              style: TextStyle(color: Colors.green),
            ),
            onTap: () {
              _searchController.text = "";
            },
          )
        ],
      ),
    );
  }

  //条数
  Widget _count(int count) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      child: Text(
        "为您找到相关结果$count条",
        style: TextStyle(fontSize: ScreenUtil().setSp(35)),
      ),
    );
  }

  //绑定内容
  Widget _content() {
    return Container(
        height: ScreenUtil().setHeight(1400),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[100], width: ScreenUtil().setSp(20))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: ScreenUtil().setSp(40),
                        color: Colors.blue,
                      ),
                      Text(
                        "门店名称：" + listCompany[index].name,
                        style: TextStyle(fontSize: ScreenUtil().setSp(40)),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: ScreenUtil().setSp(40),
                        color: Colors.blue,
                      ),
                      Text(
                        "注册地址：" + list[index].registerName,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.ac_unit,
                        size: ScreenUtil().setSp(40),
                        color: Colors.blue,
                      ),
                      Text(
                        "责任人：" + list[index].liablePerson,
                        style: TextStyle(fontSize: ScreenUtil().setSp(35)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.room,
                        size: ScreenUtil().setSp(40),
                        color: Colors.blue,
                      ),
                      Text(
                        "地址：" + list[index].address,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: ScreenUtil().setSp(40),
                        color: Colors.blue,
                      ),
                      Text(
                        "负责人电话：" + list[index].phone,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: list.length,
        ));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
          title: Text("附近的责任单位"),
          leading: Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  size: ScreenUtil().setSp(40),
                ),
                Text("返回")
              ],
            ),
          ),
          actions: <Widget>[
            Text(
              "...",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(80),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            _search(),
            _count(list.length),
            _content(),
          ],
        ));
  }
}
