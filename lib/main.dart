// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/Pages/HomePage.dart';
import 'package:project1/Pages/Page3.dart';
import 'package:project1/Pages/StartPage.dart';
import 'package:project1/Pages/page3ingridView.dart';
import 'package:project1/Pages/theme.dart';
import 'package:project1/widgets/drawer.dart';
//import '';
//import 'package:project1/Pages/HomePage.dart';
//import 'package:project1/Pages/StartPage.dart';
//import 'package:project1/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  home: HomePage(),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/2ndpage",
      routes: {
        "/": (context) => StartPage(),
        "/Login": (context) => HomePage(),
        "/2ndpage": (context) => Page3(),
        "/drawer": (context) => MyDrawer(),
        "/page3grideview": (context) => PageGrid(),
      },
    );
  }
}
