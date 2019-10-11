import 'package:nues_feet_flutter/local/bookmark.dart';
import 'package:nues_feet_flutter/local/database_helper.dart';
import 'package:nues_feet_flutter/model/article.dart';

class AddRemoveBookmarkUseCase {

  final Future<DatabaseHelper> _bookmarksBean;

  AddRemoveBookmarkUseCase(this._bookmarksBean);

  Future<void> add(Article article) async {
    DatabaseHelper database = await _bookmarksBean;
    return database.bookmarkDao.addBookmark(Bookmark.fromArticle(article));
  }

  Future<void> remove(Article article) async {
    DatabaseHelper database = await _bookmarksBean;
    return database.bookmarkDao.removeBookmark(Bookmark.fromArticle(article));
  }

}