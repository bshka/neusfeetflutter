import 'package:floor/floor.dart';
import 'package:nues_feet_flutter/local/bookmark_dao.dart';
import 'package:nues_feet_flutter/local/bookmark.dart';

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Bookmark])
abstract class AppDatabase extends FloorDatabase {

  BookmarkDao get bookmarkDao;
  Stream<String> get changesListener => changeListener.stream;


}