import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/screens/HomeScreen.dart';
import 'package:tvmaze_search_bloc/screens/TvShowsPage.dart';
import 'package:tvmaze_search_bloc/screens/swiper/HorizontalSwiper.dart';
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
          primarySwatch: Colors.yellow,
          canvasColor: Colors.white10
      ),
//          home: HomePageBloc(title: 'By Tv Maze'),
//        home: HomePage(title: 'By Tv Maze'),
      home: HorizontalSwiper(),
//      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
