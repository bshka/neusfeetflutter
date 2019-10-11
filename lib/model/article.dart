import 'package:intl/intl.dart';
import 'package:nues_feet_flutter/local/bookmark.dart';

final DateFormat _kFormat = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss', 'en');

class Article {
  final int localId;

  final DateTime publishedAt;

  final String author;

  final String urlToImage;

  final String description;

  final String sourceName;

  final String sourceId;

  final String title;

  final String url;

  final String content;

  Article(
      {this.localId,
      this.publishedAt,
      this.author,
      this.urlToImage,
      this.description,
      this.sourceName,
      this.sourceId,
      this.title,
      this.url,
      this.content});

  factory Article.fromBookmark(Bookmark bookmark) {
    return Article(
      localId: bookmark.localId,
      publishedAt: DateTime.fromMillisecondsSinceEpoch(
          bookmark.publishedAtMillisSinceEpoch),
      author: bookmark.author,
      urlToImage: bookmark.urlToImage,
      description: bookmark.description,
      sourceName: bookmark.sourceName,
      sourceId: bookmark.sourceId,
      title: bookmark.title,
      url: bookmark.url,
      content: bookmark.content,
    );
  }

  factory Article.fromJson(Map<String, dynamic> article) {
    return Article(
      publishedAt: _kFormat.parse(article['publishedAt']),
      author: article['author'],
      urlToImage: article['urlToImage'],
      description: article['description'],
      sourceName: article['source']['name'],
      sourceId: article['source']['id'],
      title: article['title'],
      url: article['url'],
      content: article['content'],
    );
  }

  @override
  String toString() {
    return 'Article{publishedAt: ${publishedAt.millisecondsSinceEpoch}, author: $author, '
        'urlToImage: $urlToImage, description: $description, sourceName: $sourceName, '
        'sourceId: $sourceId, title: $title, url: $url, content: $content, localId: $localId}';
  }
}
