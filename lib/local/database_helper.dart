import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:nues_feet_flutter/model/article.dart';

class DatabaseHelper {
  static DatabaseHelper _instance;
  static String _kDBPath = 'bookmarks.db';
  SqfliteAdapter _adapter;
  ArticleBean _bookmarksBean;

  ArticleBean get bookmarks => _bookmarksBean;

  DatabaseHelper._();

  Future<bool> _init() async {
    try {
      _adapter = SqfliteAdapter(_kDBPath);
      await _adapter.connect();

      _bookmarksBean = ArticleBean(_adapter);
      await _bookmarksBean.createTable(ifNotExists: true);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<DatabaseHelper> instance() async {
    if (_instance == null) {
      _instance = DatabaseHelper._();
      await _instance._init();
    }
    return _instance;
  }
}
