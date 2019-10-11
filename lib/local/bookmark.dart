import 'package:floor/floor.dart';
import 'package:nues_feet_flutter/model/article.dart';

@entity
class Bookmark {
  @PrimaryKey(autoGenerate: true)
  final int localId;

  final int publishedAtMillisSinceEpoch;

  final String author;

  final String urlToImage;

  final String description;

  final String sourceName;

  final String sourceId;

  final String title;

  final String url;

  final String content;

  Bookmark(
      this.localId,
        this.publishedAtMillisSinceEpoch,
        this.author,
        this.urlToImage,
        this.description,
        this.sourceName,
        this.sourceId,
        this.title,
        this.url,
        this.content);

  factory Bookmark.fromArticle(Article article) {
    return Bookmark(
      article.localId,
      article.publishedAt.millisecondsSinceEpoch,
      article.author,
      article.urlToImage,
      article.description,
      article.sourceName,
      article.sourceId,
      article.title,
      article.url,
      article.content,
    );
  }

  @override
  String toString() {
    return 'Bookmark{localId: $localId, publishedAt: $publishedAtMillisSinceEpoch, author: $author, '
        'urlToImage: $urlToImage, description: $description, sourceName: $sourceName, '
        'sourceId: $sourceId, title: $title, url: $url, content: $content}';
  }
}