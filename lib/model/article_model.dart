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
}
