import 'package:flutter/material.dart';
import 'package:flutter_news/collection/detail_view.dart';
import 'package:flutter_news/model/home_model.dart';
import 'package:flutter_news/tool/net_manager.dart';

class CategoryListView extends StatefulWidget {
  String path;
  String title;

  CategoryListView(this.path, this.title);

  @override
  State<StatefulWidget> createState() => _CategoryListViewState(path, title);
}

class _CategoryListViewState extends State<CategoryListView> {
  ScrollController _scrollController;
  NetManager _netManager = NetManager();
  List<HomeData> _datalist = List<HomeData>();
  int _currentPage = 1;

  String path;
  String title;

  _CategoryListViewState(this.path, this.title);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _requestData(_currentPage);
        }
      });
    _requestData(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    AppBar _appbar = AppBar(
      title: Text(title),
    );
    return Scaffold(
      appBar: _appbar,
      body: Container(
        child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, index);
              },
              itemCount: this._datalist.length,
              controller: _scrollController,
            ),
            onRefresh: _onRefresh),
        width: MediaQuery.of(context).size.width,
        height:
            MediaQuery.of(context).size.height - _appbar.preferredSize.height,
        color: Colors.white,
      ),
    );
  }

  Future<Null> _onRefresh() async {
    _currentPage = 1;
    await _requestData(_currentPage);
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(
                _datalist[index].picUrl.contains("http")
                    ? _datalist[index].picUrl
                    : "http:" + _datalist[index].picUrl,
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
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  width: MediaQuery.of(context).size.width - 130 - 20,
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
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 1),
      ),
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext build) {
          return DetailView(_datalist[index].url, _datalist[index].title);
        }));
      },
    );
  }

  Future _requestData(int page) async {
    HomeModel data = await _netManager.queryListDate(path, page);
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
}
