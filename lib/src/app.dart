import 'package:flutter/material.dart';
import 'package:gamealive/src/modules/sharedpref_provider.dart';
import 'package:gamealive/src/pages/home_page.dart';
import 'package:gamealive/src/pages/search_page.dart';
import 'package:gamealive/src/pages/more_page.dart';
import 'package:ionicons/ionicons.dart';

import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  SharedPrefProvider provider;
  int _currentPage = 1;
  final List<Widget> _navItems = [
    SearchPage(),
    HomePage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {

    provider = Provider.of<SharedPrefProvider>(context);
    provider.setInstance();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 12,
        items: [
          BottomNavigationBarItem(icon: Icon(Ionicons.search_outline), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Ionicons.home_outline), label: '홈'),
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
