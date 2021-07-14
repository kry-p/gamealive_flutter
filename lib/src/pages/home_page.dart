import 'package:flutter/material.dart';
import 'package:gamealive/src/modules/api_provider.dart';
import 'package:gamealive/src/modules/date.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiProvider provider;
  DateConverter converter;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ApiProvider>(context);
    converter = DateConverter();

    return FutureBuilder(
      future: provider.getDataByDate(converter.dateToString(2021, 3, 1), converter.dateToString(2021, 7, 14), 1),
      builder: (context, snapshot) {
        if(snapshot.data!=null){
          return Container(
            child: Center(
              child: Text(snapshot.data.toString()),
            ),
          );
        }
        else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
