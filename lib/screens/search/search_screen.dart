import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/screens/articles/articles_list.dart';
import 'package:nues_feet_flutter/screens/search/search_bar.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) =>
          ArticlesListProvider(DataProvider.of(context).searchArticlesUseCase),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SearchBar(),
            SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 1,
              child: ArticlesList(),
            ),
          ],
        ),
      ),
    );
  }
}
