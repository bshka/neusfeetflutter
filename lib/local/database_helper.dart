import 'dart:async';
import 'dart:io';

import 'package:nues_feet_flutter/local/app_database.dart';
import 'package:nues_feet_flutter/local/bookmark_dao.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _instance;
  static String _kDBPath = 'bookmarks.db';

  static AppDatabase _database;

  BookmarkDao get bookmarkDao => _database.bookmarkDao;

  Stream<String> get changeListener => _database.changesListener;

  DatabaseHelper._();

  Future<bool> _init() async {
    try {
      _database = await $FloorAppDatabase.databaseBuilder(_kDBPath).build();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<DatabaseHelper> instance() async {
    if (_instance == null) {
//      Sqflite.devSetDebugModeOn(true);
      _instance = DatabaseHelper._();
      if (!await _instance._init()) {
        throw DatabaseException('Can\'t create database!');
      }
    }
    return _instance;
  }
}

class DatabaseException extends IOException {
  final String message;

  DatabaseException(this.message);

  @override
  String toString() {
    return 'DatabaseException{message: $message}';
  }
}
