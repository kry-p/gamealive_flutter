import 'package:flutter/material.dart';
import 'package:gamealive/src/components/menu_item.dart';

class MorePage extends StatelessWidget {

  final List<String> commonMenu = <String>[
    '서비스 소개',
    '개인정보 처리방침',
    '버전 정보',
    '오픈소스 라이선스',
  ];

  final List<Widget> memberMenuWidget = <Widget>[
    MenuItem(
      title: '마이페이지',
      description: '테스트',
    ),
    MenuItem(
      title: '알림 설정',
    ),
  ];

  Widget listItem(Color color, String title) => Container(
    height: 32,
    color: color,
    child: Center(
      child: Text(
        "$title",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("더보기"),
            elevation: 8,
            pinned: true,
            floating: true,
            expandedHeight: 160,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30)
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4
            ),
            delegate: SliverChildBuilderDelegate(
                (context, index) => listItem(Color.fromARGB(255,255,0,0),"item #$index"),
              childCount: 4,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final int itemIndex = index ~/ 2;
                if (index.isEven) {
                  return memberMenuWidget[itemIndex];
                }
                return Divider(height: 0, color: Colors.grey[300]);
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: 2*memberMenuWidget.length,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom:24),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final int itemIndex = index ~/ 2;
                if (index.isEven) {
                  return Padding(
                      child: Text(commonMenu[itemIndex]),
                      padding: EdgeInsets.all(16));
                }
                return Divider(height: 0, color: Colors.grey[300]);
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: 2*commonMenu.length,
            ),
          ),
        ],
      ),
    );
  }
}
