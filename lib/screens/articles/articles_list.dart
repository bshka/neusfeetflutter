import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/model/article_model.dart';
import 'package:nues_feet_flutter/network/api_helper.dart' as Api;
import 'package:nues_feet_flutter/network/use_case_headlines.dart';
import 'package:nues_feet_flutter/screens/articles/article_card.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var article = Article(
//      title: 'Quick Brown Fox Jumps Over',
//      url: null,
//      author: null,
//      content: null,
//      description:
//      'Synth polaroid bitters chillwave pickled. Vegan disrupt tousled, Portland keffiyeh aesthetic food',
//      localId: null,
//      publishedAt: null,
//      sourceId: null,
//      sourceName: 'Google News',
//      urlToImage: null,
//    );

    return Consumer<ArticlesListProvider>(
      builder: (context, holder, child) {
        return ListView.builder(
          itemBuilder: (context, position) {
            return ArticleCard(
              holder.articles[position],
              onTap: () {},
              onBookmark: () {},
            );
          },
          itemCount: holder.articles.length,
        );
      },
    );

    /*return Container(
      child: ArticleCard(
        article,
        onTap: () {},
        onBookmark: () {},
      ),
    )*/
  }
}

class ArticlesListProvider with ChangeNotifier {
  List<Article> _articles = [];
  final LoadHeadlinesUseCase _useCase;

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  ArticlesListProvider(this._useCase) {
    loadData();
  }

  void add(List<Article> articles) {
    _articles.addAll(articles);
    notifyListeners();
  }

  static ArticlesListProvider of(context) => Provider.of(context);

  void loadData() async {
    Api.Result result = await _useCase.load();
    if (result is Api.Success<List<Article>>) {
      _articles.addAll(result.value);
      notifyListeners();
    } else if (result is Api.Error) {
      // TODO show error
      print(result.exception);
    }
  }
}
