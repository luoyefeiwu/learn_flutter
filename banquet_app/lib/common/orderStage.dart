import 'package:flutter/cupertino.dart';

class OrderStage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderStageState();
}

class _OrderStageState extends State<OrderStage> {
  List<String> _categorys = ["商机", "意向", "锁台", "签约", "准备", "礼仪"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
              child: Container(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _getItem(index);
                },
                itemCount: _categorys.length - 1,
                scrollDirection: Axis.horizontal),
            color: Color.fromARGB(255, 244, 244, 235),
           // height: 40,
          )),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "礼仪",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 0, 192, 147)),
                ),
                Text("。", style: TextStyle(fontSize: 8),)
              ],
            ),
            color: Color.fromARGB(255, 244, 244, 235),
            width: MediaQuery.of(context).size.width / 6,
          )
        ],
      ),
      height: 56,
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 51, 51, 51),
      margin: EdgeInsets.only(left: 10, top: 20, right: 10),
    );
  }

  Widget _getItem(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            _categorys[index],
            style: TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 0, 192, 147)),
          ),
          Text(
            "。",
            style: TextStyle(fontSize: 8),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width / 6,
      color: Color.fromARGB(255, 244, 244, 235),
    );
  }
}
