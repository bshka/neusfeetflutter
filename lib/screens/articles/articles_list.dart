import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/main.dart';
import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/network/api_helper.dart' as Api;
import 'package:nues_feet_flutter/network/use_case_load_articles.dart';
import 'package:nues_feet_flutter/screens/article_preview_screen.dart';
import 'package:nues_feet_flutter/screens/articles/article_card.dart';
import 'package:provider/provider.dart';
import 'package:stream_transform/stream_transform.dart';

class ArticlesList extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final bool isDismissible;

  ArticlesList({this.isDismissible = false});

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

  Future<void> _addOrRemoveArticle(
      BuildContext context, Article article) async {
    if (article.localId != null) {
      await DataProvider.of(context).addRemoveBookmarkUseCase.remove(article);
    } else {
      await DataProvider.of(context).addRemoveBookmarkUseCase.add(article);
    }
  }

  Widget _itemBuilder(
      {ArticlesListProvider holder, BuildContext context, int position}) {
    // pagination
    if (position >= holder.articles.length - 10) {
      holder.loadMore();
    }
    final article = holder.articles[position];

    var item = ArticleCard(
      article,
      onTap: () {
        NavigationProvider.of(context)
            .openScreen(context, ArticlePreviewScreen(article));
      },
      onBookmark: () async {
        await _addOrRemoveArticle(context, article);
        await holder.refresh();
      },
    );

    if (isDismissible) {
      return Dismissible(
        key: Key(article.toString() + '$position'),
        child: item,
        onDismissed: (_) async {
          await DataProvider.of(context)
              .addRemoveBookmarkUseCase
              .remove(article);
          await holder.refresh();
        },
      );
    } else {
      return item;
    }
  }
}

class ArticlesListProvider with ChangeNotifier {
  List<Article> _articles = [];
  final LoadArticlesUseCase _useCase;
  int _page = 1;
  bool _canLoadMore = true;
  bool _isLoading = false;
  String _query;
  var _searchController = StreamController<String>();

  UnmodifiableListView<Article> get articles => UnmodifiableListView(_articles);

  ArticlesListProvider(this._useCase) {
    _loadData();

    // search debounce
    debounce(
      Duration(milliseconds: 500),
    ).bind(_searchController.stream).listen(
          (query) {
            print('Search text input: $query');
            _query = query;
            refresh();
          },
          cancelOnError: false,
          onError: (error) {
            print(error);
          },
        );
  }

  void add(List<Article> articles) {
    _articles.addAll(articles);
    notifyListeners();
  }

  static ArticlesListProvider of(context) => Provider.of(context);

  Future<void> _loadData() async {
    _isLoading = true;

    Api.Result result = await _useCase.load(page: _page, query: _query);
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
    _articles.clear();
    return _loadData();
  }

  void search(String query) {
    _searchController.add(query);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
  }
}
