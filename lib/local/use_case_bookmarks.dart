import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/network/api_helper.dart';
import 'package:nues_feet_flutter/network/use_case_load_articles.dart';
import 'dart:math';

import 'database_helper.dart';

class LoadBookmarksUseCase extends LoadArticlesUseCase {
  final Future<DatabaseHelper> _bookmarksBean;

  LoadBookmarksUseCase(this._bookmarksBean);

  @override
  Future<Result<List<Article>>> load(
      {int page = 1, int pageSize = 20, String query, String sources}) async {
    try {
      var helper = await _bookmarksBean;
      List<Article> result = await helper.bookmarks
          .findMany(helper.bookmarks.finder.offset((page - 1) * pageSize).limit(pageSize));
      return Result.success(result);
    } catch (e) {
      return Result.error(e);
    }
  }
}
