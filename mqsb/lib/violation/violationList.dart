import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mqsb/model/company.dart';

//违规列表
class ViolationList extends StatefulWidget {
  @override
  State createState() => _ViolationListState();
}

class _ViolationListState extends State<ViolationList> {
  List<Company> list = listCompany;
  TextEditingController _searchController = TextEditingController();

  //查询条件
  Widget _search() {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0,bottom: 10),
            width: ScreenUtil().setWidth(900),
            height: ScreenUtil().setHeight(100),
            child: TextField(
              controller: _searchController,
              onChanged: (v) {
                if (v == "") {
                  list = listCompany;
                } else {
                  list = listCompany
                      .where((element) => element.name.indexOf(v) > -1)
                      .toList();
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

  //违规
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.all(8.0),
      height: ScreenUtil().setHeight(250),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(10),
            color: Colors.blue,
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          child: Text("金棕护肤造型${index}"),
                          onTap: () {
                            Navigator.pushNamed(context, "/violationInfo");
                          },
                        )),
                    Row(
                      children: [
                        Icon(
                          Icons.book,
                          color: Colors.blueAccent,
                        ),
                        Text(
                          "处理反馈",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone,size: ScreenUtil().setSp(45),color: Colors.blueAccent,),
                        Text("(010)1891149452${index}"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.volume_down,
                          color: Colors.redAccent,
                        ),
                        Text(
                          "点击提醒",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  //违规
  Widget _violation() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: _listItemBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
        title: Text("违规列表"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _search(),
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              margin: EdgeInsets.only(left: 20, top: 10, bottom: 10,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "责任单位未处理",
                    style: TextStyle(fontSize: ScreenUtil().setSp(45)),
                  ),
                  Icon(Icons.arrow_downward),
                ],
              ),
            ),
            Expanded(child: _violation())
          ],
        ),
      ),
    );
  }
}
