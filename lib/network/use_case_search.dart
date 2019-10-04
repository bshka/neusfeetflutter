import 'package:nues_feet_flutter/model/article_model.dart';
import 'package:nues_feet_flutter/network/use_case_load_articles.dart';

import 'api_helper.dart';

class SearchArticlesUseCase extends LoadArticlesUseCase {
  static final SearchArticlesUseCase _singleton =
      SearchArticlesUseCase._internal();
  ApiHelper _apiHelper;

  @override
  Future<Result<List<Article>>> load(
      {int page = 1, int pageSize = 20, String query, String sources}) async {
    return _apiHelper.getEverything(
        page: page, pageSize: pageSize, query: query, sources: sources);
  }

  factory SearchArticlesUseCase(ApiHelper helper) {
    _singleton._apiHelper = helper;
    return _singleton;
  }

  SearchArticlesUseCase._internal();
}
