import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/app/my_app_android.dart';
import 'package:nues_feet_flutter/app/my_app_ios.dart';
import 'package:nues_feet_flutter/network/api_helper.dart';
import 'package:nues_feet_flutter/network/use_case_headlines.dart';
import 'package:nues_feet_flutter/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (_) => DataProvider()),
        Provider(builder: (_) => NavigationProvider()),
      ],
      child:
          Platform.isIOS ? MyAppiOS(MainScreen()) : MyAppAndroid(MainScreen()),
    );
  }
}

class DataProvider {
  final LoadHeadlinesUseCase loadHeadlinesUseCase =
      LoadHeadlinesUseCase(ApiHelper());

  static DataProvider of(context) => Provider.of(context, listen: false);
}

class NavigationProvider {
  void openScreen(BuildContext context, Widget screen) {
    Navigator.push(context, _openAndroidScreen(context, screen));
  }

  Route _openAndroidScreen(context, screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }

  Route _openiOSScreen(context, screen) {
    return CupertinoPageRoute(builder: (_) => screen);
  }

  static NavigationProvider of(context) => Provider.of(context, listen: false);
}
