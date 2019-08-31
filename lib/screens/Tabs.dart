import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search/screens/swiper/HomePage.dart';
import 'package:tvmaze_search/screens/search/SearchPage.dart';


class Tabs extends StatelessWidget {

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
            backgroundColor: Colors.grey[600],
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
//                title: Text("Home", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white70)),
                icon: Icon(Icons.home, color: Colors.white70,),
                activeIcon: Icon(Icons.home, color: Colors.black87,)
              ),
              BottomNavigationBarItem(
//                title: Text("Search"),
                icon: Icon(Icons.search, color: Colors.white70,),
                  activeIcon: Icon(Icons.search, color: Colors.black87, )
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore, color: Colors.white70,),
                  activeIcon: Icon(Icons.explore, color: Colors.black87, )
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings_solid, color: Colors.white70,),
                activeIcon: Icon(CupertinoIcons.settings_solid, color: Colors.black87, )
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 3);
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => HomePage(),
                  defaultTitle: 'Horizontal Swiper',
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => SearchPage(),
                  defaultTitle: 'Home Page Bloc',
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => HomePage(),
                  defaultTitle: 'Discover Page',
                );
                break;
              case 3:
                return CupertinoTabView(
                  builder: (BuildContext context) => HomePage(),
                  defaultTitle: 'Settings Page',
                );
                break;
            }
            return null;
          },
        ),
      ),
    );
  }
}
