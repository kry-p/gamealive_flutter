import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:gamealive/src/pages/dummypage1.dart';
import 'package:gamealive/src/pages/dummypage2.dart';
import 'package:gamealive/src/pages/more_page.dart';
import 'package:ionicons/ionicons.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _currentPage = 1;
  final List<Widget> _navItems = [
    Dummy1(),
    Dummy2(),
    MorePage(),
  ];

  Widget _buildNavBar() {
    return CustomNavigationBar(
      items: [
        CustomNavigationBarItem(icon: Icon(Ionicons.search_outline)),
        CustomNavigationBarItem(icon: Icon(Ionicons.home_outline)),
        CustomNavigationBarItem(icon: Icon(Ionicons.settings_outline)),
      ],
      iconSize: 24.0,
      backgroundColor: Colors.white,
      currentIndex: _currentPage,
      onTap: (index) {
        setState(() {
          _currentPage = index;
        });
      }
    );
  }

  Widget _buildCurvedNavBar() {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      height: 64,
      items: <Widget>[
        Icon(Ionicons.search_outline),
        Icon(Ionicons.home_outline),
        Icon(Ionicons.settings_outline),
      ],
      onTap: (index){
        setState(() {
          _currentPage = index;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Ionicons.home_outline), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Ionicons.search_outline), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Ionicons.ellipsis_horizontal_outline), label: '더보기'),
        ],
        currentIndex: _currentPage,
        onTap: (index){
          setState(() {
            _currentPage = index;
          });
        },
      ),
      body: SafeArea(
        child: _navItems[_currentPage]
      ),
    );
  }
}
