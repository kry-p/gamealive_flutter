import 'package:flutter/material.dart';
import 'package:gamealive/src/app.dart';
import 'package:flutter/services.dart';
import 'package:gamealive/src/modules/api_provider.dart';
import 'package:gamealive/src/modules/sharedpref_provider.dart';
import 'package:gamealive/src/pages/settings_page.dart';

import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(32, 0, 0, 0),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GameAliveApp());
}

class GameAliveApp extends StatefulWidget {
  const GameAliveApp({Key key}) : super(key: key);

  @override
  _GameAliveAppState createState() => _GameAliveAppState();
}

class _GameAliveAppState extends State<GameAliveApp> {

  final Map<String, Color> _colorMap = {
    "Color1": Color.fromARGB(255, 246, 234, 140),
    "Color2": Color.fromARGB(255, 242, 109, 91),
    "Color3": Color.fromARGB(255, 192, 53, 70),
    "Color4": Color.fromARGB(255, 73, 37, 64),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SharedPrefProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: _colorMap['Color2'],
          accentColor: _colorMap['Color1'],
          fontFamily: 'SpoqaHanSans'
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => App(),
          '/settings': (context) => SettingsPage(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ko','KR')
        ],
      ),
    );
  }
}
