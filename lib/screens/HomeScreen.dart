import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/screens/swiper/HorizontalSwiper.dart';

import 'HomePage.dart';
import 'HomePageBloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      onWillPop: () => Future<bool>.value(true),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: CupertinoTabScaffold(
          backgroundColor: Colors.white12,
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.black12,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, color: Colors.black,),
                activeIcon: Icon(CupertinoIcons.home, color: Colors.white70,)
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search, color: Colors.black,),
                  activeIcon: Icon(CupertinoIcons.search, color: Colors.white70, )
              ),
//              BottomNavigationBarItem(
//                icon: Icon(CupertinoIcons.heart),
//              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 1);
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => HorizontalSwiper(),
                  defaultTitle: 'Horizontal Swiper',
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => HomePageBloc(),
                  defaultTitle: 'Home Page Bloc',
                );
                break;
//              case 2:
//                return CupertinoTabView(
//                  builder: (BuildContext context) => HomePage(),
//                  defaultTitle: 'Home Page',
//                );
                break;
            }
            return null;
          },
        ),
      ),
    );
  }
}
