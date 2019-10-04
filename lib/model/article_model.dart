import 'package:intl/intl.dart';

class Article {
  static final DateFormat _kFormat =
      DateFormat('yyyy-MM-dd\'T\'HH:mm:ss', 'en');

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

  const Article(
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
}
