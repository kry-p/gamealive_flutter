import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamealive/src/modules/sharedpref_provider.dart';

import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPrefProvider prefProvider;
  var _recentFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _recentFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    prefProvider = Provider.of<SharedPrefProvider>(context);

    int _fetchRecentDuration = 30;
    bool _getRejectedGames = false;
    bool _getCancelledGames = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('설정', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('최근 심의정보를 가져올 기간 (일)'),
                  SizedBox(
                    width: 120,
                    height: 60,
                    child: TextFormField(
                      initialValue: prefProvider.getPreferences("fetchRecentDuration") == null ?
                        _fetchRecentDuration.toString() : prefProvider.getPreferences("fetchRecentDuration").toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                      ),
                      onChanged: (text){
                        _fetchRecentDuration = int.parse(text);
                        prefProvider.setPreferencesByInteger("fetchRecentDuration", _fetchRecentDuration);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('심의 취소된 게임 정보를 가져오기'),
                  Switch(
                    value: prefProvider.getPreferences("getCancelledGames") == null ?
                    _getCancelledGames : prefProvider.getPreferences("getCancelledGames"),
                    onChanged: (value) {
                      setState(() {
                        _getCancelledGames = value;
                        prefProvider.setPreferencesByBoolean("getCancelledGames", _getCancelledGames);
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('심의 거부된 게임 정보를 가져오기'),
                  Switch(
                    value: prefProvider.getPreferences("getRejectedGames") == null ?
                      _getRejectedGames : prefProvider.getPreferences("getRejectedGames"),
                    onChanged: (value) {
                      setState(() {
                        _getRejectedGames = value;
                        prefProvider.setPreferencesByBoolean("getRejectedGames", _getRejectedGames);
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
