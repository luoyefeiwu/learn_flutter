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
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text("1")
//          Image.network(posts[index].imageUrl),
//          SizedBox(height: 16.0),
//          Text(posts[index].title, style: Theme.of(context).textTheme.title),
//          Text(posts[index].author, style: Theme.of(context).textTheme.subhead),
//          SizedBox(height: 16.0),
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
        child: Column(
          children: [_search(), _violation()],
        ),
      ),
    );
  }
}
