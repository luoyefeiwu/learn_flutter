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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //构建轮播组件
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
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
          } else {
            //构建列表数据组件
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
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
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
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
              ),
            );
          }
        },
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
    );
  }
}
