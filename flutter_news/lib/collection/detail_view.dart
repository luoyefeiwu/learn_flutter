import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

class DetailView extends StatefulWidget {
  String url;
  String title;

  DetailView(this.url, this.title);

  @override
  State<StatefulWidget> createState() => _DetailViewState(url, title);
}

class _DetailViewState extends State<DetailView> {
  String url;
  String title;

  _DetailViewState(this.url, this.title);

  WebController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppBar _appbar = AppBar(
      title: Text(title),
    );
    return Scaffold(
      appBar: _appbar,
      body: Container(
        child: FlutterNativeWeb(onWebCreated: (WebController controller) {
          _controller = controller;
          controller.loadUrl(this.url);
        }),
        width: MediaQuery.of(context).size.width,
        height:
            MediaQuery.of(context).size.height - _appbar.preferredSize.height,
      ),
    );
  }
}
