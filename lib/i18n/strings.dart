import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class Strings {
  Strings(this.localeName);

  static Future<Strings> load(Locale locale) async {
    print(locale.toString());
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    print(localeName);

    return initializeMessages(localeName).then((_) {
      return Strings(localeName);
    });
  }

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'NeusFeet',
      name: 'appName',
      desc: 'Application name',
      locale: localeName,
    );
  }

  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Home tab',
      locale: localeName,
    );
  }

  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Search tab',
      locale: localeName,
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings tab',
      locale: localeName,
    );
  }

  String get bookmarks {
    return Intl.message(
      'Bookmarks',
      name: 'bookmarks',
      desc: 'Bookmarks tab',
      locale: localeName,
    );
  }

  String get searchHint {
    return Intl.message(
      'Search news…',
      name: 'searchHint',
      desc: 'Search hint',
      locale: localeName,
    );
  }

  String get readArticle {
    return Intl.message(
      'Read article',
      name: 'readArticle',
      desc: 'Read article button',
      locale: localeName,
    );
  }

  String get emptyArticles {
    return Intl.message(
      'Nothing to show…',
      name: 'emptyArticles',
      desc: 'Empty view text',
      locale: localeName,
    );
  }

  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: 'Category tab',
      locale: localeName,
    );
  }

  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: 'Country tab',
      locale: localeName,
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Language tab',
      locale: localeName,
    );
  }

  String get openInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'openInBrowser',
      desc: 'Open in browser button',
      locale: localeName,
    );
  }

  String get bookmarkAdded {
    return Intl.message(
      'Bookmark added!',
      name: 'bookmarkAdded',
      desc: 'Bookmark added message',
      locale: localeName,
    );
  }

  String get bookmarkRemoved {
    return Intl.message(
      'Bookmark removed!',
      name: 'bookmarkRemoved',
      desc: 'Bookmark removed message',
      locale: localeName,
    );
  }

}

class AppStringsDelegate extends LocalizationsDelegate<Strings> {
  const AppStringsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);

  @override
  bool shouldReload(AppStringsDelegate old) => false;
}
