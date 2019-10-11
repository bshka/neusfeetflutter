import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:nues_feet_flutter/local/database_helper.dart';
import 'package:nues_feet_flutter/network/api_helper.dart';

import 'article.dart';

/// Articles list load interface
mixin LoadArticlesUseCaseStream<T> {
  Stream<T> get data => _controller.stream;

  List<Article> _localDataStorage = [];
  StreamController<T> _controller = StreamController<T>();
  bool _canLoadMore = true;

  bool get canLoadMore => _canLoadMore;

  Future<void> load(
      {int page = 1, int pageSize = 20, String query, String sources}) async {
    if (_canLoadMore) {
      return _onLoad(page, pageSize, query, sources);
    }
  }

  Future<void> reload({int count = 20, String query, String sources}) async {
    _canLoadMore = true;
    _localDataStorage.clear();
    return _onReload(count, query, sources);
  }

  Future<void> _onLoad(int page, int pageSize, String query, String sources);

  Future<void> _onReload(int count, String query, String sources) async {
    await load(page: 1, pageSize: count, query: query, sources: sources);
  }

  void dispose() {
    _controller.close();
  }
}

/// Bookmarks screen implementation
class LoadBookmarksUseCase with LoadArticlesUseCaseStream<List<Article>> {
  final Future<DatabaseHelper> _bookmarksBean;
  StreamSubscription _updatesSubscription;

  LoadBookmarksUseCase(this._bookmarksBean) {
    _addChangeListener();
  }

  @override
  Future<void> _onLoad(
      int page, int pageSize, String query, String sources) async {
    var helper = await _bookmarksBean;
    try {
      // load data
      var result = await helper.bookmarkDao
          .getBookmarks(pageSize, (page - 1) * pageSize);
      // map and add to local storage
      _localDataStorage.addAll(
        result.map(
          (bookmark) => Article.fromBookmark(bookmark),
        ),
      );
      // push to subscribers
      _controller.sink.add(_localDataStorage);
    } catch (e) {
      print(e);
      _canLoadMore = false;
      _controller.sink.addError(e);
    }
  }

  void _addChangeListener() async {
    var helper = await _bookmarksBean;
    _updatesSubscription = helper.changeListener.listen((string) async {
      print('Bookmarks change listener called');
      await reload();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _updatesSubscription?.cancel();
  }
}

/// Search screen implementation
class SearchArticlesUseCase with LoadArticlesUseCaseStream<List<Article>> {
  final ApiHelper _apiHelper;

  SearchArticlesUseCase(this._apiHelper);

  @override
  Future<void> _onLoad(
      int page, int pageSize, String query, String sources) async {
    var result = await _apiHelper.getEverything(
        page: page, pageSize: pageSize, query: query, sources: sources);

    if (result is Success) {
      _localDataStorage.addAll((result as Success).value);
      _controller.add(_localDataStorage);
    } else {
      _canLoadMore = false;
      _controller.addError((result as Error).exception);
    }
  }
}

/// Home screen implementation
class LoadHeadlinesUseCase with LoadArticlesUseCaseStream<List<Article>> {
  final ApiHelper _apiHelper;

  LoadHeadlinesUseCase(this._apiHelper);

  @override
  Future<void> _onLoad(
      int page, int pageSize, String query, String sources) async {
    var result = await _apiHelper.getHeadlines(
        page: page, pageSize: pageSize, query: query, sources: sources);

    if (result is Success) {
      _localDataStorage.addAll((result as Success).value);
      _controller.sink.add(_localDataStorage);
    } else {
      _canLoadMore = false;
      _controller.sink.addError((result as Error).exception);
    }
  }
}
