// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ArticleBean implements Bean<Article> {
  final localId = IntField('local_id');
  final publishedAt = DateTimeField('published_at');
  final author = StrField('author');
  final urlToImage = StrField('url_to_image');
  final description = StrField('description');
  final sourceName = StrField('source_name');
  final sourceId = StrField('source_id');
  final title = StrField('title');
  final url = StrField('url');
  final content = StrField('content');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        localId.name: localId,
        publishedAt.name: publishedAt,
        author.name: author,
        urlToImage.name: urlToImage,
        description.name: description,
        sourceName.name: sourceName,
        sourceId.name: sourceId,
        title.name: title,
        url.name: url,
        content.name: content,
      };
  Article fromMap(Map map) {
    Article model = Article(
      localId: adapter.parseValue(map['local_id']),
      publishedAt: adapter.parseValue(map['published_at']),
      author: adapter.parseValue(map['author']),
      urlToImage: adapter.parseValue(map['url_to_image']),
      description: adapter.parseValue(map['description']),
      sourceName: adapter.parseValue(map['source_name']),
      sourceId: adapter.parseValue(map['source_id']),
      title: adapter.parseValue(map['title']),
      url: adapter.parseValue(map['url']),
      content: adapter.parseValue(map['content']),
    );

    return model;
  }

  List<SetColumn> toSetColumns(Article model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.localId != null) {
        ret.add(localId.set(model.localId));
      }
      ret.add(publishedAt.set(model.publishedAt));
      ret.add(author.set(model.author));
      ret.add(urlToImage.set(model.urlToImage));
      ret.add(description.set(model.description));
      ret.add(sourceName.set(model.sourceName));
      ret.add(sourceId.set(model.sourceId));
      ret.add(title.set(model.title));
      ret.add(url.set(model.url));
      ret.add(content.set(model.content));
    } else if (only != null) {
      if (model.localId != null) {
        if (only.contains(localId.name)) ret.add(localId.set(model.localId));
      }
      if (only.contains(publishedAt.name))
        ret.add(publishedAt.set(model.publishedAt));
      if (only.contains(author.name)) ret.add(author.set(model.author));
      if (only.contains(urlToImage.name))
        ret.add(urlToImage.set(model.urlToImage));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
      if (only.contains(sourceName.name))
        ret.add(sourceName.set(model.sourceName));
      if (only.contains(sourceId.name)) ret.add(sourceId.set(model.sourceId));
      if (only.contains(title.name)) ret.add(title.set(model.title));
      if (only.contains(url.name)) ret.add(url.set(model.url));
      if (only.contains(content.name)) ret.add(content.set(model.content));
    } else /* if (onlyNonNull) */ {
      if (model.localId != null) {
        ret.add(localId.set(model.localId));
      }
      if (model.publishedAt != null) {
        ret.add(publishedAt.set(model.publishedAt));
      }
      if (model.author != null) {
        ret.add(author.set(model.author));
      }
      if (model.urlToImage != null) {
        ret.add(urlToImage.set(model.urlToImage));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
      }
      if (model.sourceName != null) {
        ret.add(sourceName.set(model.sourceName));
      }
      if (model.sourceId != null) {
        ret.add(sourceId.set(model.sourceId));
      }
      if (model.title != null) {
        ret.add(title.set(model.title));
      }
      if (model.url != null) {
        ret.add(url.set(model.url));
      }
      if (model.content != null) {
        ret.add(content.set(model.content));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(localId.name,
        primary: true, autoIncrement: true, isNullable: false);
    st.addDateTime(publishedAt.name, isNullable: true);
    st.addStr(author.name, isNullable: true);
    st.addStr(urlToImage.name, isNullable: true);
    st.addStr(description.name, isNullable: true);
    st.addStr(sourceName.name, isNullable: true);
    st.addStr(sourceId.name, isNullable: true);
    st.addStr(title.name, isNullable: true);
    st.addStr(url.name, isNullable: true);
    st.addStr(content.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Article model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(localId.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Article newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<Article> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Article model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(localId.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Article newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<Article> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Article model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.localId.eq(model.localId))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Article> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.localId.eq(model.localId));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Article> find(int localId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.localId.eq(localId));
    return await findOne(find);
  }

  Future<int> remove(int localId) async {
    final Remove remove = remover.where(this.localId.eq(localId));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Article> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.localId.eq(model.localId));
    }
    return adapter.remove(remove);
  }
}
