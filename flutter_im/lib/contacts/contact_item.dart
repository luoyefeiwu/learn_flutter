// 好友列表项
import 'package:flutter/material.dart';
import 'contact_vo.dart';

//好友列表项
class ContactItem extends StatelessWidget {
  //好友数据VO
  final ContactVO item;

  //标题名称
  final String titleName;

  //图片路径
  final String imageName;

  ContactItem({this.item, this.titleName, this.imageName});

  //渲染
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.white,),);
  }
}
