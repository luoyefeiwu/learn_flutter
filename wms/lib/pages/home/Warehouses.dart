import 'package:flutter/material.dart';

import '../../common/Token.dart';
import '../../config/Api.dart';
import '../../config/HttpUtil.dart';

//仓库列表
class Warehouses extends StatefulWidget {
  const Warehouses({super.key, required this.title});

  final String title;

  @override
  State<Warehouses> createState() => _WarehousesState();
}

class _WarehousesState extends State<Warehouses> {
  var _selectedValue = "";
  List _list = [];

  @override
  initState() {
    super.initState();
    initData();
  }

  //初始化数据
  initData() async {
    var response = await HttpUtils.post(
        servicePath["listWarehouseByUser"].toString(),
        data: {});
    if (response['code'] == 0) {
      setState(() {
        _list = [];
        _list.addAll(response["data"]);
        if(_list.length>0){
          _selectedValue=_list[0]["warehouseCode"].toString();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('请选择仓库'),
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                children: getRadioList(context),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: MaterialButton(
                  onPressed: () async {
                    // 存储 仓库编码
                    await saveWarehouseCode(_selectedValue);
                    Navigator.pushNamed(context, '/index');
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
        )));
  }

  //获取radio
  List<Widget> getRadioList(BuildContext context) {
    return _list
        .map((f) => RadioListTile(
              title: Text(f['warehouseName']),
              value: f['warehouseCode'].toString(),
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ))
        .toList();
  }
}
