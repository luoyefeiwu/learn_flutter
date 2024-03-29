import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mqsb/model/company.dart';
import 'package:url_launcher/url_launcher.dart';

//违规列表
class ViolationList extends StatefulWidget {
  @override
  State createState() => _ViolationListState();
}

class _ViolationListState extends State<ViolationList> {
  List<Company> list = listCompany;
  TextEditingController _searchController = TextEditingController();

  void _launchURL(String phone) async {
    String url = 'tel:' + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url 不能进行访问，异常';
    }
  }

  //查询条件
  Widget _search() {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1.0),
      child: Row(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0, bottom: 10),
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
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(8.0),
      height: ScreenUtil().setHeight(250),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(10),
           // color: Colors.blue,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
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
                          child: Text("责任单位-演示 ${index}",style: TextStyle(fontSize: 18),),
                          onTap: () {
                            Navigator.pushNamed(context, "/violationInfo");
                          },
                        )),
                    Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.blueAccent,
                          size: 18,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/feedback");
                          },
                          child: Text(
                            "处理反馈",
                            style: TextStyle(color: Colors.blueAccent,fontSize: 18),
                          ),
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
                        Icon(
                          Icons.phone,
                          size: ScreenUtil().setSp(45),
                          color: Colors.blueAccent,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL("(010)1891149452${index}");
                          },
                          child: Text("(010)1891149452${index}"),
                        )
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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _search(),
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            margin: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "责任单位未处理",
                  style: TextStyle(fontSize: ScreenUtil().setSp(45)),
                ),
                Icon(Icons.keyboard_arrow_down,size: 30,),
              ],
            ),
          ),
          Expanded(child: _violation())
        ],
      ),
    );
  }
}
