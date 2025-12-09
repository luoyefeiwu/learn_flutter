import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up/widget/common_floating_action_button.dart';
import 'package:hook_up/widget/common_form_item.dart';
import 'package:hook_up/widget/common_image_picker.dart';
import 'package:hook_up/widget/common_radio_form_item.dart';
import 'package:hook_up/widget/common_select_form_item.dart';
import 'package:hook_up/widget/common_title.dart';
import 'package:hook_up/widget/room_appliance.dart';

// 房源发布
class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  //租赁方式
  int rentType = 0;

  //装修方式
  int decorationType = 0;

  //户型
  int roomType = 0;

  //楼层
  int floor = 0;

  //朝向
  int oriented = 0;

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源发布'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CommonTitle(title: '房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.of(context).pushNamed('search');
                      },
                      child: Container(
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '请选择小区',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      )));
            },
          ),
          CommonFormItem(
            label: '租金',
            hinintText: '请输入租金',
            suffixTetx: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hinintText: '请输入房屋大小',
            suffixTetx: '平方米',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: '租售方式',
            options: ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            },
          ),
          CommonSelectFormItem(
              label: '户型',
              value: roomType,
              options: ['一室', '二室', '三室', '四室'],
              onChange: (val) {
                setState(() {
                  roomType = val;
                });
              }),
          CommonSelectFormItem(
              label: '朝向',
              value: oriented,
              options: ['东', '南', '西', '北'],
              onChange: (val) {
                setState(() {
                  oriented = val;
                });
              }),
          CommonSelectFormItem(
              label: '楼层',
              value: floor,
              options: ['高楼层', '中楼层', '低楼层'],
              onChange: (val) {
                setState(() {
                  floor = val;
                });
              }),
          CommonRadioFormItem(
            label: '装修',
            options: ['精装', '简装'],
            value: decorationType,
            onChange: (index) {
              setState(() {
                decorationType = index;
              });
            },
          ),
          CommonTitle(title: '房屋图像'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          CommonTitle(title: '房源标题'),
          Container(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: '请输入标题(例如：整租，小区名 2 室 2000元)',
                  border: InputBorder.none),
            ),
          ),
          CommonTitle(title: '房屋配置'),
          RoomAppliance(onChange: (data) {}),
          CommonTitle(title: '房屋描述'),
          Container(
            margin: EdgeInsets.only(bottom: 100.0),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: '请输入房屋描述', border: InputBorder.none),
            ),
          ),
        ],
      ),
      floatingActionButton: CommonFloatingActionButton(
        title: '提交',
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
