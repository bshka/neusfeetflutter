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
    return Consumer<ArticlesListProvider>(
      builder: (context, holder, child) {
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, position) {
            // pagination
            if (position == holder.articles.length - 10) {
              holder.loadMore();
            }

            if (position == 0) {
              return RefreshIndicator(
                child: null,
                onRefresh: null,
              );
            } else {
              return ArticleCard(
                holder.articles[position],
                onTap: () {},
                onBookmark: () {},
              );
            }
          },
          itemCount: holder.articles.length,
        );
      },
    );
  }
}

class ArticlesListProvider with ChangeNotifier {
  List<Article> _articles = [];
  final LoadHeadlinesUseCase _useCase;
  int _page = 1;
  bool _canLoadMore = true;
  bool _isLoading = false;

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  ArticlesListProvider(this._useCase) {
    _loadData();
  }

  void add(List<Article> articles) {
    _articles.addAll(articles);
    notifyListeners();
  }

  static ArticlesListProvider of(context) => Provider.of(context);

  Future<void> _loadData() async {
    _isLoading = true;

    Api.Result result = await _useCase.load(page: _page);
    if (result is Api.Success<List<Article>>) {
      _articles.addAll(result.value);
      notifyListeners();
    } else if (result is Api.Error) {
      // TODO show error
      _canLoadMore = false;
      print(result.exception);
    }

    _isLoading = false;
  }

  void loadMore() {
    if (!_isLoading && _canLoadMore) {
      _page++;
      _loadData();
    }
  }

  Future<void> refresh() {
    _canLoadMore = true;
    _page = 1;
    return _loadData();
  }
}
