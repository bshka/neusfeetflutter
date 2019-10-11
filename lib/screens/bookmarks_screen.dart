import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/main.dart';
import 'package:provider/provider.dart';

import 'articles/articles_list.dart';

class BookmarksScreen extends StatefulWidget {
  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) =>
          ArticlesListProvider(DataProvider.of(context).loadBookmarksUseCase),
      child: SafeArea(
        child: ArticlesList(
          Strings.of(context).bookmarksEmptyText,
          isDismissible: true,
        ),
      ),
    );
  }
}
