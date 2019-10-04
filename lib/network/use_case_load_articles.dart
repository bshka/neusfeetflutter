import 'package:nues_feet_flutter/model/article_model.dart';

import 'api_helper.dart';

abstract class LoadArticlesUseCase {
  Future<Result<List<Article>>> load({int page = 1, int pageSize = 20, String query, String sources});
}
