import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool showLocation; // 展示位置按钮
  final Function? gobackCallback; // 返回按钮回调
  final String inputValue; // 搜索数据库值
  final String defaultInputValue; // 默认搜索值
  final Function? onCancel; // 取消按钮回调
  final bool showMap; // 展示地图按钮
  final Function? onSearch; // 用户点击搜索框触发
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar({
    super.key,
    this.showLocation = false,
    this.gobackCallback,
    this.inputValue = '',
    this.defaultInputValue = '请输入搜索词',
    this.onCancel,
    this.showMap = false,
    this.onSearch,
    this.onSearchSubmit,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller;
  late FocusNode _foucs; // 添加 FocusNode

  @override
  void initState() {
    _controller = TextEditingController(text: widget.inputValue);
    _foucs = FocusNode(); // 初始化 FocusNode
    super.initState();
  }

  //清理
  _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
    return () => {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        if (widget.showLocation)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                    size: 16,
                  ),
                  Text(
                    '北京',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
        if (widget.gobackCallback != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                widget.gobackCallback;
              },
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        Expanded(
            child: Container(
          height: 34.0,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(17.0)),
          // padding: EdgeInsets.only(right: 10.0),
          child: TextField(
            focusNode: _foucs,
            controller: _controller,
            onTap: () {
              if (null == widget.onSearchSubmit) {
                _foucs.unfocus();
              }
              widget.onSearch!();
            },
            onSubmitted: widget.onSearchSubmit,
            textInputAction: TextInputAction.search,
            onChanged: (String value) {
              setState(() {
                _searchWord = value;
              });
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(right: 1),
                isDense: false,
                // 确保不是紧凑模式
                border: InputBorder.none,
                hintText: '请输入搜索词',
                prefixIcon: Icon(
                  Icons.search,
                  size: 18.0,
                  color: Colors.grey,
                ),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.clear,
                    size: 18.0,
                    color: _searchWord == '' ? Colors.grey[200] : Colors.grey,
                  ),
                  onTap: () {
                    _onClean();
                  },
                )),
          ),
        )),
        if (widget.onCancel != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                widget.onCancel;
              },
              child: Text("取消",
                  style: TextStyle(fontSize: 14.0, color: Colors.black)),
            ),
          ),
        if (widget.showMap)
          Icon(
            Icons.map_outlined,
            color: Colors.black,
            size: 20,
          ),
      ],
    ));
  }
}
