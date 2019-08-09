import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/HomePage.dart';
import 'screens/HomePageBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tv Show',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Color.fromARGB(255, 4, 125, 141)),
      home: HomePageBloc(title: 'By Tv Maze'),
      /* home: HomePage(title: 'By Tv Maze'), */
      debugShowCheckedModeBanner: false,
    );
  }
}
