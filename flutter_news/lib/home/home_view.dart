import 'package:flutter/material.dart';

// 导入轮播插件
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_news/tool/net_manager.dart';
import 'package:flutter_news/model/home_model.dart';

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
  NetManager _netManager = NetManager();
  List<HomeData> _datalist = List<HomeData>();
  int _currentPage = 1;

  Future _requestData(int page) async {
    HomeModel data = await _netManager.queryHomeDate(page);
    if (page == 1) {
      //刷新
      _datalist.clear();
      _datalist.addAll(data.newslist);
    } else {
      //加载更多
      _datalist.addAll(data.newslist);
    }
    _currentPage++;
    this.setState(() {});
    return;
  }

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
          _requestData(_currentPage);
        }
      });
    _requestData(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //使用Flutter原生下拉刷新新组件
      child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                //构建轮播组件
                return _buildSwiper(context);
              } else {
                //构建列表数据组件
                return _buildItem(context, index);
              }
            },
            itemCount: _getItemCount(),
            controller: _scrollController,
          ),
          onRefresh: _onRefresh),
    );
  }

  int _getItemCount() {
    if (_datalist != null && _datalist.length > 3) {
      //聚合2个内容作为轮播内容
      return _datalist.length - 3 + 1;
    } else {
      return 0;
    }
  }

  //模拟下刷新方法
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      _currentPage = 1;
      _requestData(_currentPage);
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
              child: Image.network(
                _datalist[index].picUrl,
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      height: 150,
      margin: EdgeInsets.only(bottom: 5),
    );
  }

  //构建列表项组件
  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              _datalist[index].picUrl,
              width: 130,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  _datalist[index].title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width-200,
              ),
              Container(
                child: Text(_datalist[index].description),
                margin: EdgeInsets.only(left: 10, top: 5),
              ),
              Container(
                child: Text(_datalist[index].ctime),
                margin: EdgeInsets.only(left: 10, top: 5),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        ],
      ),
      height: 110,
      width: MediaQuery.of(context).size.width + 1000,
      margin: EdgeInsets.only(bottom: 1),
    );
  }
}
