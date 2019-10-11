import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/screens/articles/articles_list.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) =>
          ArticlesListProvider(DataProvider.of(context).loadHeadlinesUseCase),
      child: SafeArea(
        child: ArticlesList(Strings.of(context).homeEmptyText),
      ),
    );
  }
}
