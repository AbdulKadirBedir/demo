import 'package:facebook_project/confing/palette.dart';
import 'package:facebook_project/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/app_provider.dart';
import 'auth/app_routes.dart';

void main() {
  runApp(MyApp());
}

/* class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: NavScreen(),
    );
  }
} */



class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Core(),
      providers: AppProviders.providers);
  }
}
class Core extends StatelessWidget {
  Core({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.LoginRoute, 
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
    );
  }
}