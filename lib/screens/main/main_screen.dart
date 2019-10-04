import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/screens/bookmarks_screen.dart';
import 'package:nues_feet_flutter/screens/home_screen.dart';
import 'package:nues_feet_flutter/screens/search_screen.dart';
import 'package:nues_feet_flutter/screens/settings_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _MainScreeniOS() : _MainScreenAndroid();
  }
}

Widget _getScreenWidget(int page) {
  switch (page) {
    case 1:
      return SearchScreen();
    case 2:
      return BookmarksScreen();
    case 3:
      return SettingsScreen();
    case 0:
    default:
      return HomeScreen();
  }
}

List<BottomNavigationBarItem> _getBottomBarItems(context) {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(Strings.of(context).home),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text(Strings.of(context).search),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_border),
      title: Text(Strings.of(context).bookmarks),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text(Strings.of(context).settings),
    ),
  ];
}

class _MainScreenAndroid extends StatefulWidget {
  @override
  _MainScreenAndroidState createState() => _MainScreenAndroidState();
}

class _MainScreenAndroidState extends State<_MainScreenAndroid> {
  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getScreenWidget(_selectedScreen),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).hintColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _selectedScreen = index;
          });
        },
        items: _getBottomBarItems(context),
      ),
    );
  }
}

class _MainScreeniOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _getBottomBarItems(context),
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                child: SafeArea(
                  child: _getScreenWidget(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
