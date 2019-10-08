import 'package:nues_feet_flutter/local/database_helper.dart';
import 'package:nues_feet_flutter/model/article.dart';

class AddRemoveBookmarkUseCase {

  final Future<DatabaseHelper> _bookmarksBean;

  AddRemoveBookmarkUseCase(this._bookmarksBean);

  Future<void> add(Article article) async {
    var database = await _bookmarksBean;
    var bean = database.bookmarks;
    return bean.insert(article);
  }

  Future<void> remove(Article article) async {
    var database = await _bookmarksBean;
    var bean = database.bookmarks;
    return bean.remove(article.localId);
  }

}