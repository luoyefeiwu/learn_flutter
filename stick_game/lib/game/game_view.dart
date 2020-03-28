import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return _GameViewState();
  }
}

class _GameViewState extends State<GameView> with TickerProviderStateMixin {
  //背景可滚动的宽度
  double _bgWidth = 0;

  //控制开始按钮状态
  double _startFontSize = 500;
  Color _startFontColor = Colors.black;

  //控制游戏状态
  double _gameViewAlpah = 0;
  Animation<double> _gameAlphaAnimation;
  AnimationController _gameAnimationController;

  //控制落点位置
  double _space = 0;

  //资源销毁
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gameAnimationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAlpahAnimation();
  }

//初始化动画方法
  void _initAlpahAnimation() {
    this._gameAnimationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    this._gameAlphaAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_gameAnimationController)
          ..addListener(() {
            setState(() {
              _gameViewAlpah = _gameAlphaAnimation.value;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    _bgWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    if (size == 0) {
      _space = Random().nextInt(size.width.toInt() - 200).toDouble();
    }
    return Container(
      child: Stack(
        children: <Widget>[
          _buildBG(size),
          _buildStartGameButton(size),
          _buildGameContainerView(size),
          _buildGameTitle(size),
        ],
      ),
    );
  }

  Widget _buildBG(Size size) {
    Image image = Image.asset(
      "src/img/bg.jpeg",
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.fitHeight,
      alignment: Alignment.bottomLeft,
    );
    //获取背景图片尺寸
    image.image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo image, bool synchronousCall) {
      double scala = image.image.height / size.height;
      _bgWidth = (image.image.width / scala) - size.height;
      this.setState(() {});
    }));

    return Positioned(
      child: image,
      left: 0,
    );
  }

  //构建游戏标题
  Widget _buildGameTitle(Size size) {
    return Positioned(
      child: Opacity(
        opacity: 1 - _gameViewAlpah,
        child: Container(
          child: Center(
            child: Text(
              "棍子传奇",
              style: TextStyle(
                  fontSize: 80,
                  fontFamily: "Custom",
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
          height: 90,
          width: size.width,
        ),
      ),
      top: size.height / 2 - 150,
    );
  }

//构建游戏功能按钮
  Widget _buildStartGameButton(Size size) {
    return Positioned(
      child: Opacity(
        opacity: 1 - _gameViewAlpah,
        child: GestureDetector(
          child: Container(
            child: Center(
              child: Text(
                "开始游戏",
                style: TextStyle(
                    fontSize: _startFontSize,
                    fontFamily: "Custom",
                    color: _startFontColor,
                    decoration: TextDecoration.none),
              ),
            ),
            height: 60,
            width: size.width,
          ),
          onTapDown: (Tab) {
            _startFontSize = 40;
            _startFontColor = Colors.black26;
            this.setState(() {});
          },
          onTapUp: (tab) {
            _startGame();
          },
          onPanEnd: (tab) {
            _startGame();
          },
          onPanCancel: () {
            _startGame();
          },
        ),
      ),
      top: size.height / 2 + 60,
    );
  }

  //构建核心游戏逻辑容器视图
  Widget _buildGameContainerView(Size size) {
    return Positioned(
      child: Opacity(
        opacity: _gameViewAlpah,
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  color: Colors.black.withAlpha(200),
                ),
                width: 100,
                height: size.height / 2.4,
                bottom: 0,
              ),
              Positioned(
                child: Container(color: Colors.black.withAlpha(200)),
                width: 100,
                left: 100 + _space,
                height: size.height / 2.4,
                bottom: 0,
              ),
              Positioned(
                child: Container(
                  color: Colors.black.withAlpha(200),
                ),
                width: 10,
                left: 100 - 10.0,
                height: 24,
                bottom: size.height / 2.4,
              ),
            ],
          ),
          color: Colors.transparent,
        ),
      ),
      width: size.width,
      height: size.height,
    );
  }

  void _startGame() {
    _startFontSize = 50;
    _startFontColor = Colors.black;
    this._gameAnimationController.forward();
  }
}
