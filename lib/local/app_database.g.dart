// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookmarkDao _bookmarkDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Bookmark` (`localId` INTEGER PRIMARY KEY AUTOINCREMENT, `publishedAtMillisSinceEpoch` INTEGER, `author` TEXT, `urlToImage` TEXT, `description` TEXT, `sourceName` TEXT, `sourceId` TEXT, `title` TEXT, `url` TEXT, `content` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  BookmarkDao get bookmarkDao {
    return _bookmarkDaoInstance ??= _$BookmarkDao(database, changeListener);
  }
}

class _$BookmarkDao extends BookmarkDao {
  _$BookmarkDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _bookmarkInsertionAdapter = InsertionAdapter(
            database,
            'Bookmark',
            (Bookmark item) => <String, dynamic>{
                  'localId': item.localId,
                  'publishedAtMillisSinceEpoch':
                      item.publishedAtMillisSinceEpoch,
                  'author': item.author,
                  'urlToImage': item.urlToImage,
                  'description': item.description,
                  'sourceName': item.sourceName,
                  'sourceId': item.sourceId,
                  'title': item.title,
                  'url': item.url,
                  'content': item.content
                },
            changeListener),
        _bookmarkDeletionAdapter = DeletionAdapter(
            database,
            'Bookmark',
            ['localId'],
            (Bookmark item) => <String, dynamic>{
                  'localId': item.localId,
                  'publishedAtMillisSinceEpoch':
                      item.publishedAtMillisSinceEpoch,
                  'author': item.author,
                  'urlToImage': item.urlToImage,
                  'description': item.description,
                  'sourceName': item.sourceName,
                  'sourceId': item.sourceId,
                  'title': item.title,
                  'url': item.url,
                  'content': item.content
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _bookmarkMapper = (Map<String, dynamic> row) => Bookmark(
      row['localId'] as int,
      row['publishedAtMillisSinceEpoch'] as int,
      row['author'] as String,
      row['urlToImage'] as String,
      row['description'] as String,
      row['sourceName'] as String,
      row['sourceId'] as String,
      row['title'] as String,
      row['url'] as String,
      row['content'] as String);

  final InsertionAdapter<Bookmark> _bookmarkInsertionAdapter;

  final DeletionAdapter<Bookmark> _bookmarkDeletionAdapter;

  @override
  Future<List<Bookmark>> getBookmarks(int limit, int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Bookmark ORDER BY localId DESC LIMIT ? OFFSET ?',
        arguments: <dynamic>[limit, offset],
        mapper: _bookmarkMapper);
  }

  @override
  Stream<List<Bookmark>> getAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Bookmark',
        tableName: 'Bookmark', mapper: _bookmarkMapper);
  }

  @override
  Future<void> addBookmark(Bookmark article) async {
    await _bookmarkInsertionAdapter.insert(
        article, sqflite.ConflictAlgorithm.replace);
  }

  @override
  Future<void> removeBookmark(Bookmark article) async {
    await _bookmarkDeletionAdapter.delete(article);
  }
}
