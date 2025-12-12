import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/index.dart';
import 'package:hook_up/provider/room_filter.dart';
import 'package:hook_up/routes.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);

    return ChangeNotifierProvider(
      create: (context) => FilterBarModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
        ),
        home: const HomePage(),
        onGenerateRoute: router.generator,
      ),
    );
  }
}
