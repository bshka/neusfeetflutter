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

  String get bookmarksEmptyText {
    return Intl.message(
      'There are still no bookmarks. Try to add one first!',
      name: 'bookmarksEmptyText',
      desc: 'No bookmarks message',
      locale: localeName,
    );
  }

  String get homeEmptyText {
    return Intl.message(
      'There are no headlines. Try again later.',
      name: 'homeEmptyText',
      desc: 'No headlines message',
      locale: localeName,
    );
  }

  String get searchEmptyText {
    return Intl.message(
      'Can\'t find news with for this request. Try different keywords.',
      name: 'searchEmptyText',
      desc: 'No news in search message',
      locale: localeName,
    );
  }

  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  // ========================================================================
  // categories
  // ========================================================================

  String get businessCategory {
    return Intl.message(
      'Business',
      name: 'businessCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  String get entertainmentCategory {
    return Intl.message(
      'Entertaiment',
      name: 'entertainmentCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  String get generalCategory {
    return Intl.message(
      'General',
      name: 'generalCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  String get healthCategory {
    return Intl.message(
      'Health',
      name: 'healthCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  String get scienceCategory {
    return Intl.message(
      'Science',
      name: 'scienceCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  String get sportsCategory {
    return Intl.message(
      'Sports',
      name: 'sportsCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  String get technologyCategory {
    return Intl.message(
      'Technology',
      name: 'technologyCategory',
      desc: 'No filter in settings',
      locale: localeName,
    );
  }

  // ========================================================================
  // Languages
  // ========================================================================

  String get arabicLanguage {
    return Intl.message(
      'Arabic',
      name: 'arabicLanguage',
      desc: 'Arabic language',
      locale: localeName,
    );
  }

  String get germanLanguage {
    return Intl.message(
      'German',
      name: 'germanLanguage',
      desc: 'German language',
      locale: localeName,
    );
  }

  String get englishLanguage {
    return Intl.message(
      'English',
      name: 'englishLanguage',
      desc: 'English language',
      locale: localeName,
    );
  }

  String get spanishLanguage {
    return Intl.message(
      'Spanish',
      name: 'spanishLanguage',
      desc: 'Spanish language',
      locale: localeName,
    );
  }

  String get frenchLanguage {
    return Intl.message(
      'French',
      name: 'frenchLanguage',
      desc: 'French language',
      locale: localeName,
    );
  }

  String get hebrewLanguage {
    return Intl.message(
      'Hebrew',
      name: 'hebrewLanguage',
      desc: 'Hebrew language',
      locale: localeName,
    );
  }

  String get italianLanguage {
    return Intl.message(
      'Italian',
      name: 'italianLanguage',
      desc: 'Italian language',
      locale: localeName,
    );
  }

  String get dutchLanguage {
    return Intl.message(
      'Dutch',
      name: 'dutchLanguage',
      desc: 'Dutch language',
      locale: localeName,
    );
  }

  String get norwegianLanguage {
    return Intl.message(
      'Norwegian',
      name: 'norwegianLanguage',
      desc: 'Norwegian language',
      locale: localeName,
    );
  }

  String get portugueseLanguage {
    return Intl.message(
      'Portuguese',
      name: 'portugueseLanguage',
      desc: 'Portuguese language',
      locale: localeName,
    );
  }

  String get russianLanguage {
    return Intl.message(
      'Russian',
      name: 'russianLanguage',
      desc: 'Russian language',
      locale: localeName,
    );
  }

  String get northernSamiLanguage {
    return Intl.message(
      'Northern Sami',
      name: 'northernSamiLanguage',
      desc: 'Northern Sami language',
      locale: localeName,
    );
  }

  String get urduLanguage {
    return Intl.message(
      'Urdu',
      name: 'urduLanguage',
      desc: 'Urdu language',
      locale: localeName,
    );
  }

  String get chineseLanguage {
    return Intl.message(
      'Chinese',
      name: 'chineseLanguage',
      desc: 'Chinese language',
      locale: localeName,
    );
  }

  // ========================================================================
  // Countries
  // ========================================================================

  String get aeCountry {
    return Intl.message(
      'United Arab Emirates',
      name: 'aeCountry',
      desc: 'United Arab Emirates',
      locale: localeName,
    );
  }

  String get arCountry {
    return Intl.message(
      'Argentina',
      name: 'arCountry',
      desc: 'Argentina',
      locale: localeName,
    );
  }

  String get atCountry {
    return Intl.message(
      'Austria',
      name: 'atCountry',
      desc: 'Austria',
      locale: localeName,
    );
  }

  String get auCountry {
    return Intl.message(
      'Australia',
      name: 'auCountry',
      desc: 'Australia',
      locale: localeName,
    );
  }

  String get beCountry {
    return Intl.message(
      'Belgium',
      name: 'beCountry',
      desc: 'Belgium',
      locale: localeName,
    );
  }

  String get bgCountry {
    return Intl.message(
      'Bulgaria',
      name: 'bgCountry',
      desc: 'Bulgaria',
      locale: localeName,
    );
  }

  String get brCountry {
    return Intl.message(
      'Brazil',
      name: 'brCountry',
      desc: 'Brazil',
      locale: localeName,
    );
  }

  String get caCountry {
    return Intl.message(
      'Canada',
      name: 'caCountry',
      desc: 'Canada',
      locale: localeName,
    );
  }

  String get chCountry {
    return Intl.message(
      'Switzerland',
      name: 'chCountry',
      desc: 'Switzerland',
      locale: localeName,
    );
  }

  String get cnCountry {
    return Intl.message(
      'China',
      name: 'cnCountry',
      desc: 'China',
      locale: localeName,
    );
  }

  String get coCountry {
    return Intl.message(
      'Colombia',
      name: 'coCountry',
      desc: 'Colombia',
      locale: localeName,
    );
  }

  String get cuCountry {
    return Intl.message(
      'Cuba',
      name: 'cuCountry',
      desc: 'Cuba',
      locale: localeName,
    );
  }

  String get czCountry {
    return Intl.message(
      'Czech Republic',
      name: 'czCountry',
      desc: 'Czech Republic',
      locale: localeName,
    );
  }

  String get deCountry {
    return Intl.message(
      'Germany',
      name: 'deCountry',
      desc: 'Germany',
      locale: localeName,
    );
  }

  String get egCountry {
    return Intl.message(
      'Egypt',
      name: 'egCountry',
      desc: 'Egypt',
      locale: localeName,
    );
  }

  String get frCountry {
    return Intl.message(
      'France',
      name: 'frCountry',
      desc: 'France',
      locale: localeName,
    );
  }

  String get gbCountry {
    return Intl.message(
      'United Kingdom',
      name: 'gbCountry',
      desc: 'United Kingdom',
      locale: localeName,
    );
  }

  String get grCountry {
    return Intl.message(
      'Greece',
      name: 'grCountry',
      desc: 'Greece',
      locale: localeName,
    );
  }

  String get hkCountry {
    return Intl.message(
      'Hong Kong',
      name: 'hkCountry',
      desc: 'Hong Kong',
      locale: localeName,
    );
  }

  String get huCountry {
    return Intl.message(
      'Hungary',
      name: 'huCountry',
      desc: 'Hungary',
      locale: localeName,
    );
  }

  String get idCountry {
    return Intl.message(
      'Indonesia',
      name: 'idCountry',
      desc: 'Indonesia',
      locale: localeName,
    );
  }

  String get ieCountry {
    return Intl.message(
      'Ireland',
      name: 'ieCountry',
      desc: 'Ireland',
      locale: localeName,
    );
  }

  String get ilCountry {
    return Intl.message(
      'Israel',
      name: 'ilCountry',
      desc: 'Israel',
      locale: localeName,
    );
  }

  String get inCountry {
    return Intl.message(
      'India',
      name: 'inCountry',
      desc: 'India',
      locale: localeName,
    );
  }

  String get itCountry {
    return Intl.message(
      'Italy',
      name: 'itCountry',
      desc: 'Italy',
      locale: localeName,
    );
  }

  String get jpCountry {
    return Intl.message(
      'Japan',
      name: 'jpCountry',
      desc: 'Japan',
      locale: localeName,
    );
  }

  String get krCountry {
    return Intl.message(
      'Korea, Republic of',
      name: 'krCountry',
      desc: 'Korea, Republic of',
      locale: localeName,
    );
  }

  String get ltCountry {
    return Intl.message(
      'Lithuania',
      name: 'ltCountry',
      desc: 'Lithuania',
      locale: localeName,
    );
  }

  String get lvCountry {
    return Intl.message(
      'Latvia',
      name: 'lvCountry',
      desc: 'Latvia',
      locale: localeName,
    );
  }

  String get maCountry {
    return Intl.message(
      'Morocco',
      name: 'maCountry',
      desc: 'Morocco',
      locale: localeName,
    );
  }

  String get mxCountry {
    return Intl.message(
      'Mexico',
      name: 'mxCountry',
      desc: 'Mexico',
      locale: localeName,
    );
  }

  String get myCountry {
    return Intl.message(
      'Malaysia',
      name: 'myCountry',
      desc: 'Malaysia',
      locale: localeName,
    );
  }

  String get ngCountry {
    return Intl.message(
      'Nigeria',
      name: 'ngCountry',
      desc: 'Nigeria',
      locale: localeName,
    );
  }

  String get nlCountry {
    return Intl.message(
      'Netherlands',
      name: 'nlCountry',
      desc: 'Netherlands',
      locale: localeName,
    );
  }

  String get noCountry {
    return Intl.message(
      'Norway',
      name: 'noCountry',
      desc: 'Norway',
      locale: localeName,
    );
  }

  String get nzCountry {
    return Intl.message(
      'New Zealand',
      name: 'nzCountry',
      desc: 'New Zealand',
      locale: localeName,
    );
  }

  String get phCountry {
    return Intl.message(
      'Philippines',
      name: 'phCountry',
      desc: 'Philippines',
      locale: localeName,
    );
  }

  String get plCountry {
    return Intl.message(
      'Poland',
      name: 'plCountry',
      desc: 'Poland',
      locale: localeName,
    );
  }

  String get ptCountry {
    return Intl.message(
      'Portugal',
      name: 'ptCountry',
      desc: 'Portugal',
      locale: localeName,
    );
  }

  String get roCountry {
    return Intl.message(
      'Romania',
      name: 'roCountry',
      desc: 'Romania',
      locale: localeName,
    );
  }

  String get rsCountry {
    return Intl.message(
      'Serbia',
      name: 'rsCountry',
      desc: 'Serbia',
      locale: localeName,
    );
  }

  String get ruCountry {
    return Intl.message(
      'Russia',
      name: 'ruCountry',
      desc: 'Russia',
      locale: localeName,
    );
  }

  String get saCountry {
    return Intl.message(
      'Saudi Arabia',
      name: 'saCountry',
      desc: 'Saudi Arabia',
      locale: localeName,
    );
  }

  String get seCountry {
    return Intl.message(
      'Sweden',
      name: 'seCountry',
      desc: 'Sweden',
      locale: localeName,
    );
  }

  String get sgCountry {
    return Intl.message(
      'Singapore',
      name: 'sgCountry',
      desc: 'Singapore',
      locale: localeName,
    );
  }

  String get siCountry {
    return Intl.message(
      'Slovenia',
      name: 'siCountry',
      desc: 'Slovenia',
      locale: localeName,
    );
  }

  String get skCountry {
    return Intl.message(
      'Slovakia',
      name: 'skCountry',
      desc: 'Slovakia',
      locale: localeName,
    );
  }

  String get thCountry {
    return Intl.message(
      'Thailand',
      name: 'thCountry',
      desc: 'Thailand',
      locale: localeName,
    );
  }

  String get trCountry {
    return Intl.message(
      'Turkey',
      name: 'trCountry',
      desc: 'Turkey',
      locale: localeName,
    );
  }

  String get twCountry {
    return Intl.message(
      'Taiwan, Province of China',
      name: 'twCountry',
      desc: 'Taiwan, Province of China',
      locale: localeName,
    );
  }

  String get uaCountry {
    return Intl.message(
      'Ukraine',
      name: 'uaCountry',
      desc: 'Ukraine',
      locale: localeName,
    );
  }

  String get usCountry {
    return Intl.message(
      'United States',
      name: 'usCountry',
      desc: 'United States',
      locale: localeName,
    );
  }

  String get veCountry {
    return Intl.message(
      'Venezuela, Bolivarian Republic of',
      name: 'veCountry',
      desc: 'Venezuela, Bolivarian Republic of',
      locale: localeName,
    );
  }

  String get zaCountry {
    return Intl.message(
      'South Africa',
      name: 'zaCountry',
      desc: 'South Africa',
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
