import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/info/Info.dart';
import 'package:hook_up/pages/room_detail/data.dart';
import 'package:hook_up/widget/common_swipper.dart';
import 'package:hook_up/widget/common_tags.dart';
import 'package:hook_up/widget/common_title.dart';
import 'package:hook_up/widget/room_appliance.dart' show RoomApplicanceList;
import 'package:share_plus/share_plus.dart';

var bottomButtonTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;

  bool isLike = false;
  bool showAllText = false;

  //bool isLike = false;

  @override
  void initState() {
    data = defaultData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (null == data) return Container();
    bool showTextTool = data.subTitle.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Share.share('https://www.baidu.com');
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(images: data.houseIms),
              CommonTitle(title: data.title),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price.toString(),
                      style: TextStyle(fontSize: 20.0, color: Colors.pink),
                    ),
                    Text(
                      '元/月(押一付三)',
                      style: TextStyle(fontSize: 14.0, color: Colors.pink),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  spacing: 4.0,
                  children: data.tags
                      .map((item) => CommonTag(tag: item))
                      .toList(),
                ),
              ),
              Divider(color: Colors.grey, indent: 10.0, endIndent: 10.0),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  runSpacing: 20.0,
                  children: [
                    BaseInfoItem(content: '面积：${data.size} 平米'),
                    BaseInfoItem(content: '楼层：${data.floor}'),
                    BaseInfoItem(content: '房型：${data.roomType}'),
                    BaseInfoItem(content: '装修：精装'),
                  ],
                ),
              ),
              CommonTitle(title: '房屋配置'),
              RoomApplicanceList(list: data.applicances),
              CommonTitle(title: '房屋概况'),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle ?? '暂无房屋概况',
                      maxLines: showAllText ? null : 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '收起' : '展开'),
                                    Icon(
                                      showAllText
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Text('举报'),
                      ],
                    ),
                  ],
                ),
              ),
              CommonTitle(title: '猜你喜欢'),
              Info(),
              Container(height: 100.0),
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
                bottom: 20.0,
              ),
              color: Colors.grey[200],
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    child: Container(
                      height: 50.0,
                      width: 40.0,
                      margin: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            isLike ? Icons.star : Icons.star_border,
                            size: 24.0,
                            color: isLike ? Colors.green : Colors.black,
                          ),
                          Text(
                            isLike ? '已收藏' : '收藏',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.0,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                          child: Text('联系房东', style: bottomButtonTextStyle),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Center(
                          child: Text('预约看房', style: bottomButtonTextStyle),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 3 * 10.0) / 2,
      child: Text(content, style: TextStyle(fontSize: 16.0)),
    );
  }
}
