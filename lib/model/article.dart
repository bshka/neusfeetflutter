import 'package:intl/intl.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'article.jorm.dart';

class Article {
  static final DateFormat _kFormat =
      DateFormat('yyyy-MM-dd\'T\'HH:mm:ss', 'en');

  @PrimaryKey(auto: true)
  final int localId;

  @Column(isNullable: true)
  final DateTime publishedAt;

  @Column(isNullable: true)
  final String author;

  @Column(isNullable: true)
  final String urlToImage;

  @Column(isNullable: true)
  final String description;

  @Column(isNullable: true)
  final String sourceName;

  @Column(isNullable: true)
  final String sourceId;

  @Column(isNullable: true)
  final String title;

  @Column(isNullable: true)
  final String url;

  @Column(isNullable: true)
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
    return 'Article{localId: $localId, publishedAt: $publishedAt, author: $author, '
        'urlToImage: $urlToImage, description: $description, sourceName: $sourceName, '
        'sourceId: $sourceId, title: $title, url: $url, content: $content}';
  }
}

@GenBean()
class ArticleBean extends Bean<Article> with _ArticleBean {
  ArticleBean(Adapter adapter) : super(adapter);
  final String tableName = 'articles';
}
