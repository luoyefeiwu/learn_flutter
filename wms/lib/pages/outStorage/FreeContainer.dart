import 'package:wms/r.dart';
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

  List data = [];
  late String _dropdownValue = "";

  @override
  void initState() {
    initData();
    super.initState();
  }

  //初始化数据
  initData() async {
    var response = await HttpUtils.post(
        servicePath["listWarehouseByUser"].toString(),
        data: {});
    if (response['code'] == 0) {
      setState(() {
        data = [];
        data.addAll(response["data"]);
        if (data.length > 0) {
          _dropdownValue = data[0]["warehouseCode"].toString();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
          backgroundColor: Colors.white,
          centerTitle: true, //标题居中
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: _dropdownMenu(context),
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
                              title: Text("提示"),
                              content: Text(msg),
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
        ));
  }

  Widget _dropdownMenu(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownMenu<String>(
          menuHeight: 200,
          initialSelection: data.first,
          onSelected: _onSelect,
          dropdownMenuEntries: _buildMenuList(data),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('你选择的学科是: $_dropdownValue')
      ],
    );
  }

  void _onSelect(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  List<DropdownMenuEntry<String>> _buildMenuList(List data) {
    return data.map((f) {
      return DropdownMenuEntry<String>(
          value: f["warehouseCode"].toString(),
          label: f['warehouseName'].toString());
    }).toList();
  }
}
