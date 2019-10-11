// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("NeusFeet"),
    "bookmarkAdded" : MessageLookupByLibrary.simpleMessage("Bookmark added!"),
    "bookmarksEmptyText" : MessageLookupByLibrary.simpleMessage("There are still no bookmarks. Try to add one first!"),
    "bookmarkRemoved" : MessageLookupByLibrary.simpleMessage("Bookmark removed!"),
    "bookmarks" : MessageLookupByLibrary.simpleMessage("Bookmarks"),
    "category" : MessageLookupByLibrary.simpleMessage("Category"),
    "country" : MessageLookupByLibrary.simpleMessage("Country"),
    "emptyArticles" : MessageLookupByLibrary.simpleMessage("Nothing to show…"),
    "home" : MessageLookupByLibrary.simpleMessage("Home"),
    "homeEmptyText" : MessageLookupByLibrary.simpleMessage("There are no headlines. Try again later."),
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "openInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "readArticle" : MessageLookupByLibrary.simpleMessage("Read article"),
    "search" : MessageLookupByLibrary.simpleMessage("Search"),
    "searchHint" : MessageLookupByLibrary.simpleMessage("Search news…"),
    "searchEmptyText" : MessageLookupByLibrary.simpleMessage("Can\' find news with for this request. Try different keywords."),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings")
  };
}
