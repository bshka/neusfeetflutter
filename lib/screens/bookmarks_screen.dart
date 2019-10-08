import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'articles/articles_list.dart';

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) =>
          ArticlesListProvider(DataProvider.of(context).loadBookmarksUseCase),
      child: SafeArea(
        child: ArticlesList(
          isDismissible: true,
        ),
      ),
    );
  }
}
