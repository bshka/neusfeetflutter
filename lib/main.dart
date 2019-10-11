import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/app/my_app_android.dart';
import 'package:nues_feet_flutter/app/my_app_ios.dart';
import 'package:nues_feet_flutter/local/database_helper.dart';
import 'package:nues_feet_flutter/local/use_case_add_remove_bookmark.dart';
import 'package:nues_feet_flutter/model/use_case_load_articles_stream.dart';
import 'package:nues_feet_flutter/network/api_helper.dart';
import 'package:nues_feet_flutter/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  LoadHeadlinesUseCase get loadHeadlinesUseCase =>
      LoadHeadlinesUseCase(ApiHelper());

  SearchArticlesUseCase get searchArticlesUseCase =>
      SearchArticlesUseCase(ApiHelper());

  static Future<DatabaseHelper> _helper = DatabaseHelper.instance();

  LoadBookmarksUseCase get loadBookmarksUseCase =>
      LoadBookmarksUseCase(_helper);

  AddRemoveBookmarkUseCase get addRemoveBookmarkUseCase =>
      AddRemoveBookmarkUseCase(_helper);

  void dispose() {
    loadHeadlinesUseCase.dispose();
    searchArticlesUseCase.dispose();
    loadBookmarksUseCase.dispose();
  }

  static DataProvider of(context) => Provider.of(context, listen: false);
}

class NavigationProvider {
  void openScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static NavigationProvider of(context) => Provider.of(context, listen: false);
}
