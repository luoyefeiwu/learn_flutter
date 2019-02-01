import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp(items: new List<String>.generate(1000, (i) => 'Item $i')));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jerry Flutter Demo',
      home: Scaffold(
        appBar: new AppBar(title: new Text('gridview')),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1.0,
          ),
          children: <Widget>[
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',fit: BoxFit.cover),
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',fit: BoxFit.cover),
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',fit: BoxFit.cover),
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',fit: BoxFit.cover),
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',fit: BoxFit.cover),
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif',fit: BoxFit.cover),
          ],
        ),

// 网格写法的一种
//        body: GridView.count(
//          padding: const EdgeInsets.all(20.0),
//          crossAxisSpacing: 10.0,
//          crossAxisCount: 3,
//          children: <Widget>[
//            const Text('I am Jerry1'),
//            const Text('I am Jerry2'),
//            const Text('I am Jerry3'),
//            const Text('I am Jerry4'),
//            const Text('I am Jerry5'),
//            const Text('I am Jerry6'),
//          ],
//        ),
      ),
    );
  }
}
