import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/network/api_helper.dart';
import 'package:nues_feet_flutter/network/use_case_headlines.dart';
import 'package:nues_feet_flutter/screens/articles/articles_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        builder: (context) =>
            ArticlesListProvider(LoadHeadlinesUseCase(ApiHelper())),
        child: ArticlesList(),
      ),
    );
  }
}
