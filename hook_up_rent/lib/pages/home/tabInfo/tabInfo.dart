import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/Info.dart';
import 'package:hook_up_rent/widget/search_bar/index.dart';

class TabInfo extends StatelessWidget {
  const TabInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: SearchBar(
            showLocation: true,
            showMap: true,
            onSearch: (){
              Navigator.of(context).pushNamed('search');
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(children: const [
            Info()
          ]),
        ));
  }
}
