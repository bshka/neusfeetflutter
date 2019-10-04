import 'package:nues_feet_flutter/network/api_helper.dart';

class LoadHeadlinesUseCase {

  final ApiHelper apiHelper;

  LoadHeadlinesUseCase(this.apiHelper);

  Future load({int page = 1, int pageSize = 20, String query, String sources}) async {
    return apiHelper.getHeadlines(page: page, pageSize: pageSize, query: query, sources: sources);
  }


}