import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nues_feet_flutter/model/article_model.dart';

class ApiHelper {
  static const String _kBaseUrl = 'https://newsapi.org/v2/';
  static const _kHeaders = {'X-Api-Key': '8bdf9a3615c141da90ff71d9ce4ea6ad'};
  static final DateFormat _kFormat =
      DateFormat('yyyy-MM-dd\'T\'HH:mm:ss', 'en');

  static const HTTP_OK = 200;

  Future getHeadlines(
      {int page = 1, int pageSize = 20, String query, String sources}) async {
    try {
//      http.Response result = await http.get(
//          '${_kBaseUrl}top-headlines?page=$page&pageSize=$pageSize&q=query&sources=$sources',
//          headers: _kHeaders);
      http.Response result = await http.get(
          '${_kBaseUrl}top-headlines?page=$page&pageSize=$pageSize&q=trump',
          headers: _kHeaders);

      if (result.statusCode == HTTP_OK) {
        return Result.success(_parseArticles(jsonDecode(result.body)));
      } else {
        return Result.error(
          HttpException(
            'Can\'t load data',
            uri: result.request.url,
          ),
        );
      }
    } catch (e) {
      return Result.error(e);
    }
  }

//  Future<Result> getEverything(
//      {int page = 1, int pageSize = 20, String query, String sources}) async {}
//
//  Future<Result> getSources(
//      {String category, String language, String country}) async {}

  List<Article> _parseArticles(dynamic data) {
    List<Article> result = [];

    for (final article in data['articles']) {
      result.add(Article(
        publishedAt: _kFormat.parse(article['publishedAt']),
        author: article['author'],
        urlToImage: article['urlToImage'],
        description: article['description'],
        sourceName: article['source']['name'],
        sourceId: article['source']['id'],
        title: article['title'],
        url: article['url'],
        content: article['content'],
      ));
    }

    return result;
  }
}

class Result<T> {
  Result._();

  factory Result.success(T value) = Success<T>;

  factory Result.error(T exception) = Error<T>;
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value) : super._();
}

class Error<T> extends Result<T> {
  final T exception;

  Error(this.exception) : super._();
}
