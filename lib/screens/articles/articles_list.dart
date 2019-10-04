import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/main.dart';
import 'package:nues_feet_flutter/model/article_model.dart';
import 'package:nues_feet_flutter/network/api_helper.dart' as Api;
import 'package:nues_feet_flutter/network/use_case_headlines.dart';
import 'package:nues_feet_flutter/screens/article_preview_screen.dart';
import 'package:nues_feet_flutter/screens/articles/article_card.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesListProvider>(
      builder: (context, holder, child) {
        if (holder.articles.length == 0) {
          return Center(
            child: Platform.isIOS
                ? CupertinoActivityIndicator()
                : CircularProgressIndicator(),
          );
        } else {
          return Platform.isIOS
              ? _iOSListView(holder)
              : _androidListView(holder);
        }
      },
    );
  }

  Widget _androidListView(ArticlesListProvider holder) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () => holder.refresh(),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, position) {
          return _itemBuilder(
            holder: holder,
            context: context,
            position: position,
          );
        },
        itemCount: holder.articles.length,
      ),
    );
  }

  Widget _iOSListView(ArticlesListProvider holder) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: 150,
          onRefresh: () => holder.refresh(),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, position) {
                return _itemBuilder(
                  holder: holder,
                  context: context,
                  position: position,
                );
              },
              childCount: holder.articles.length,
            ),
          ),
        )
      ],
    );
  }

  Widget _itemBuilder(
      {ArticlesListProvider holder, BuildContext context, int position}) {
    // pagination
    if (position == holder.articles.length - 10) {
      holder.loadMore();
    }
    final article = holder.articles[position];
    return ArticleCard(
      article,
      onTap: () {
        NavigationProvider.of(context)
            .openScreen(context, ArticlePreviewScreen(article));
      },
      onBookmark: () {},
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
    print('refresh called');
    _canLoadMore = true;
    _page = 1;
    return _loadData();
  }
}
