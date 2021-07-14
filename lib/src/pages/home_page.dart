import 'package:flutter/material.dart';
import 'package:gamealive/src/modules/api_request.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ApiRequest request = ApiRequest();
    request.getDataByDate();

    return Container(
      child: Center(
        child: Text('테스트 위젯 1입니다.'),
      ),
    );
  }
}
