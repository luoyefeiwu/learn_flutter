import 'package:flutter/material.dart';

// 导入轮播插件
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  //声明滚动控制器属性，用来实现上拉加载更多功能
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //对控制器进行初始化
    _scrollController = ScrollController()
      ..addListener(() {
        //模拟触发上拉加载更多
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          print("上拉加载了");
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //使用Flutter原生下拉刷新新组件
      child: RefreshIndicator(
          child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              //构建轮播组件
              return _buildSwiper(context);
            } else {
              //构建列表数据组件
              return _buildItem(context, index);
            }
          }),
          onRefresh: _onRefresh),
    );
  }

  //模拟下刷新方法
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("下拉刷新了");
    });
  }

  //构建轮播组件
  Widget _buildSwiper(BuildContext context) {
    return Container(
      child: Swiper(
        pagination: SwiperPagination(),
        controller: SwiperController(),
        autoplay: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.orange,
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Center(
              child: Text(
                "轮播图$index",
                style: TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
      height: 150,
    );
  }

  //构建列表项组件
  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              "",
              width: 130,
              height: 110,
            ),
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  "新闻标题",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                //width: MediaQuery.of(context).size.width-200,
              ),
              Container(
                child: Text(
                  "新闻来源",
                ),
                margin: EdgeInsets.only(left: 10, top: 5),
              ),
              Container(
                child: Text("发布时间"),
                margin: EdgeInsets.only(left: 10, top: 5),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        ],
      ),
      height: 110,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 1),
      color: Colors.amber,
    );
  }
}
