import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wms/pages/login_page.dart';
import 'package:wms/router/app_router.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (BuildContext context) {},
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       theme: ThemeData(
  //         primaryColor: Colors.green,
  //         appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
  //       ),
  //       home: LoginPage(),
  //       // onGenerateRoute: router.generator,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
        ),
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
      ),
    );
  }
}
