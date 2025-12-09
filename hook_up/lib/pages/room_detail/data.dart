import 'package:flutter/material.dart';

class RoomDetailData {
  String id;
  String title;
  String commounity;
  String subTitle;
  int size;
  String floor;
  int price;
  String roomType;
  List<String> houseIms;
  List<String> tags;
  List<String> oriented;
  List<String> applicances;

  RoomDetailData({
    required this.id,
    required this.title,
    required this.commounity,
    required this.subTitle,
    required this.size,
    required this.floor,
    required this.price,
    required this.roomType,
    required this.houseIms,
    required this.tags,
    required this.oriented,
    required this.applicances,
  });
}

var defaultData = RoomDetailData(
    id: '111',
    title: '整租 中山路 ',
    commounity: '中山花园',
    subTitle: '近地铁,附近有商场',
    size: 100,
    floor: '高楼层',
    price: 3000,
    roomType: '三室',
    houseIms: [
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg',
      'https://res.5i5j.com/uploads/images/2025/0417/09/1744852037738407.jpg'
    ],
    tags: [
      '近地铁',
      '集中供暖',
      '新上',
      '临时看房'
    ],
    oriented: [
      '南'
    ],
    applicances: [
      '衣柜',
      '洗衣机'
    ]);
