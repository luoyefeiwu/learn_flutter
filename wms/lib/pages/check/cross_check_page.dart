import 'package:flutter/material.dart';

/// 越库质检
class CrossCheckPage extends StatefulWidget {
  const CrossCheckPage({super.key});

  @override
  State<CrossCheckPage> createState() => _CrossCheckPageState();
}

class _CrossCheckPageState extends State<CrossCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('质检'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Text(
            '质检记录',
            style: TextStyle(color: Color.fromARGB(255, 54, 98, 236)),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildTitle(
            title: '单号',
            hintText: '请输入',
            icon: Icon(Icons.search),
            onTap: () {},
          ),
          SizedBox(height: 10),
          _buildTitle(
            title: '零件编码',
            hintText: '请扫码',
            icon: Icon(Icons.camera_alt_outlined),
            onTap: () {},
          ),
          SizedBox(height: 10),
          Text('质检异常汇总(0)'),
          _buildCollect(title: '质检异常未跟单', count: 0, onTap: () {}),
          _buildCollect(title: '质检异常已跟单', count: 0, onTap: () {}),
          _buildCollect(title: '已完成', count: 0, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildTitle({
    required String title,
    required String hintText,
    required Icon icon,
    required Function onTap,
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80.0,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(title),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),

                  suffixIcon: IconButton(
                    icon: icon,
                    onPressed: () {
                      onTap();
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 12.0,
                  ),
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollect({
    required String title,
    required int count,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text('('),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 54, 98, 236),
              ),
            ),
            Text(')'),
          ],
        ),
      ),
    );
  }
}
