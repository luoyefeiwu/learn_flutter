import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';

class PageContent extends StatelessWidget {
  final String name;

  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面:$name'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextButton(
            child: Text(Routes.home),
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
          ),
          TextButton(
            child: Text(Routes.login),
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
          ),
          TextButton(
            child: const Text('不存在的页面'),
            onPressed: () {
              Navigator.pushNamed(context, '/aaa');
            },
          )
        ],
      ),
    );
  }
}
