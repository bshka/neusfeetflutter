import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/main.dart';
import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/model/use_case_load_articles_stream.dart';
import 'package:nues_feet_flutter/screens/article_preview_screen.dart';
import 'package:nues_feet_flutter/screens/articles/article_card.dart';
import 'package:nues_feet_flutter/styles/styles.dart' as Styles;
import 'package:nues_feet_flutter/styles/images.dart' as Images;
import 'package:provider/provider.dart';
import 'package:stream_transform/stream_transform.dart';

class ArticlesList extends StatefulWidget {
  final bool isDismissible;
  final String _emptyViewText;

  ArticlesList(this._emptyViewText, {this.isDismissible = false});

  @override
  _ArticlesListState createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  GlobalKey _scrollViewKey = GlobalKey();
  double _scrollViewHeight;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) {
    _scrollViewHeight = _scrollViewKey.currentContext?.size?.height;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesListProvider>(
      key: _scrollViewKey,
      builder: (context, holder, child) {
        return StreamBuilder(
          stream: holder.articlesStream,
          builder: (context, snapshot) {
            /*if (snapshot.hasError) {
              return Center(
                child: Text('Empty view'),
              );
            } else*/
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator(),
              );
            } else {
              return Platform.isIOS
                  ? _iOSListView(holder, snapshot)
                  : _androidListView(holder, snapshot);
            }
          },
        );
      },
    );
  }

  Widget _emptyView() {
    return SliverToBoxAdapter(
      child: Container(
        height: _scrollViewHeight,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(Images.emptyList),
              SizedBox(
                height: 10,
              ),
              Text(
                widget._emptyViewText,
                textAlign: TextAlign.center,
                style: Styles.textMedium.copyWith(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _androidListView(ArticlesListProvider holder, AsyncSnapshot snapshot) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () => holder.refresh(),
      child: _getListView(holder, snapshot),
    );
  }

  Widget _iOSListView(ArticlesListProvider holder, AsyncSnapshot snapshot) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: () => holder.refresh(),
        ),
        _getListView(holder, snapshot),
      ],
    );
  }

  Widget _getListView(ArticlesListProvider holder, AsyncSnapshot snapshot) {
    return SliverSafeArea(
      top: false,
      sliver: snapshot.data == null || snapshot.data.length == 0
          ? _emptyView()
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, position) {
                  return _itemBuilder(
                    holder: holder,
                    snapshot: snapshot,
                    context: context,
                    position: position,
                  );
                },
                childCount: snapshot.data.length,
              ),
            ),
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
      {ArticlesListProvider holder,
      AsyncSnapshot snapshot,
      BuildContext context,
      int position}) {
    // pagination
    if (position >= snapshot.data.length - 10) {
      holder.loadMore();
    }
    final article = snapshot.data[position];

    var item = ArticleCard(
      article,
      key: Key(article.toString()),
      onTap: () {
        NavigationProvider.of(context)
            .openScreen(context, ArticlePreviewScreen(article));
      },
      onBookmark: () async {
        await _addOrRemoveArticle(context, article);
      },
    );

    if (widget.isDismissible) {
      return Dismissible(
        key: Key(article.toString() + 'dismissable'),
        child: item,
        onDismissed: (_) async {
          await DataProvider.of(context)
              .addRemoveBookmarkUseCase
              .remove(article);
        },
      );
    } else {
      return item;
    }
  }
}

class ArticlesListProvider with ChangeNotifier {
  final LoadArticlesUseCaseStream<List<Article>> _useCase;
  int _page = 1;
  bool _isLoading = false;
  String _query;
  final _searchController = StreamController<String>();

  Stream<List<Article>> get articlesStream => _useCase.data;

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

  static ArticlesListProvider of(context) => Provider.of(context);

  Future<void> _loadData() async {
    _isLoading = true;
    await _useCase.load(page: _page, query: _query);
    _isLoading = false;
  }

  void loadMore() {
    if (!_isLoading && _useCase.canLoadMore) {
      _page++;
      _loadData();
    }
  }

  Future<void> refresh() async {
    return await _useCase.reload(query: _query);
  }

  void search(String query) {
    _searchController.add(query);
  }

  @override
  void dispose() {
    super.dispose();
    print('Articles list provider disposed');
    _searchController.close();
  }
}
