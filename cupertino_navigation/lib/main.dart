import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cupertino",
      theme: ThemeData.light(),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    //最外层导航选项卡
    return CupertinoTabScaffold(
      //底部选项卡
      tabBar: CupertinoTabBar(
        //选项卡背景色
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "主页"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble), label: "聊天"),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
                break;
              case 1:
                return ChatPage();
                break;
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}

//主页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //基本布局结构，包含内容和导航栏
      navigationBar: CupertinoNavigationBar(
        middle: Text("主页"),
      ),
      child: Center(
        child: Text("主页", style: Theme.of(context).textTheme.button),
      ),
    );
  }
}

//聊天界面
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // 导航栏 包含左中右三部分
        //中间标题
        middle: Text("聊天面板"),
        //右侧按钮
        trailing: Icon(CupertinoIcons.add),
        //左侧按钮
        leading: Icon(CupertinoIcons.back),
      ),
      child: Center(
        child: Text("聊天面板", style: Theme.of(context).textTheme.button),
      ),
    );
  }
}
