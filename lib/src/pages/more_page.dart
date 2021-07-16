import 'package:flutter/material.dart';
import 'package:gamealive/src/components/menu_item.dart';

class MorePage extends StatelessWidget {

  final List<String> commonMenu = <String>[
    '서비스 소개',
    '개인정보 처리방침',
    '버전 정보',
    '오픈소스 라이선스',
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

    final List<Widget> memberMenuWidget = <Widget>[
      MenuItem(
        title: '마이페이지',
        description: '(회원 전용) 내 정보를 확인하고 수정하세요.',
      ),
      MenuItem(
        title: '알림 설정',
        description: '(회원 전용) 새로운 심의정보 알림을 설정합니다.',
      ),
      MenuItem(
        title: '심의정보 가져오기 설정',
        description: '심의정보를 검색할 때의 옵션을 설정합니다.',
        onTap: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
    ];

    Widget scrollView = Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  "설정",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              // centerTitle: true,
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 32,
              margin: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final int itemIndex = index ~/ 2;
                if (index.isEven) {
                  return memberMenuWidget[itemIndex];
                }
                return Divider(height: 0, thickness: 0.5, color: Colors.grey[300]);
              },
              semanticIndexCallback: (Widget widget, int localIndex) {
                if (localIndex.isEven) {
                  return localIndex ~/ 2;
                }
                return null;
              },
              childCount: 2 * memberMenuWidget.length,
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
                  return Container(
                    color: Colors.white,
                    child: Padding(
                        child: Text(commonMenu[itemIndex]),
                        padding: EdgeInsets.all(16)),
                  );
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

    return scrollView;
  }
}