import 'package:floor/floor.dart';

import 'bookmark.dart';

@dao
abstract class BookmarkDao {
  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> addBookmark(Bookmark article);

  @delete
  Future<void> removeBookmark(Bookmark article);

  @Query('SELECT * FROM Bookmark ORDER BY localId DESC LIMIT :limit OFFSET :offset')
  Future<List<Bookmark>> getBookmarks(int limit, int offset);

  @Query('SELECT * FROM Bookmark')
  Stream<List<Bookmark>> getAll();

}
