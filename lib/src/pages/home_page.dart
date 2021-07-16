import 'package:flutter/material.dart';
import 'package:gamealive/src/modules/api_provider.dart';
import 'package:gamealive/src/modules/date.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiProvider provider;
  DateConverter converter;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _presentDatePicker(String picker) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    setState(() {
      if(picker=='start')
        startDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      if(picker=='end')
        endDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    });
  }

  String startDate = '시작일';
  String endDate = '종료일';

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ApiProvider>(context);
    converter = DateConverter();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("game", style: TextStyle(color: Colors.black87, fontFamily: "neodgm", letterSpacing: 2.0)),
            Text("alive", style: TextStyle(color: Color.fromARGB(255, 106, 193, 184), fontFamily: "neodgm", letterSpacing: 2.0)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Text("최신 심의 정보에요.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _presentDatePicker("start");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(startDate, style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _presentDatePicker("end");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(endDate, style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
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
              ),
            ],
          ),
      ),
    );
  }
}
