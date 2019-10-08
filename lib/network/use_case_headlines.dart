import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/network/api_helper.dart';
import 'package:nues_feet_flutter/network/use_case_load_articles.dart';

class LoadHeadlinesUseCase extends LoadArticlesUseCase {
  static final LoadHeadlinesUseCase _singleton =
      LoadHeadlinesUseCase._internal();

  ApiHelper _apiHelper;


  @override
  Future<Result<List<Article>>> load(
      {int page = 1, int pageSize = 20, String query, String sources}) async {
    return _apiHelper.getHeadlines(
        page: page, pageSize: pageSize, query: query, sources: sources);
  }

  factory LoadHeadlinesUseCase(ApiHelper helper) {
    _singleton._apiHelper = helper;
    return _singleton;
  }

  LoadHeadlinesUseCase._internal();
}
