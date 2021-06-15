import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  final List<String> entries = <String>[
    '오픈소스 라이선스',
    '알림 설정',
    '서비스 소개',
    '개인정보 처리방침',
    '버전 정보',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.all(16),
            child: Text(entries[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
