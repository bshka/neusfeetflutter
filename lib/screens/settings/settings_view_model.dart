import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';

class SettingsViewModel {
  int _selectedCountryKey = 0;
  int _selectedLanguageKey = 0;
  int _selectedCategoryKey = 0;

  List<String> _languagesValues;
  List<String> _countriesValues;
  List<String> _categoriesValues;

  SettingsViewModel._(
      this._languagesValues, this._countriesValues, this._categoriesValues);

  String get selectedCategory => _categoriesValues[_selectedCategoryKey];

  UnmodifiableListView<String> get categoriesList =>
      UnmodifiableListView(_countriesValues);

  String get selectedLanguage => _languagesValues[_selectedLanguageKey];

  UnmodifiableListView<String> get languagesList =>
      UnmodifiableListView(_countriesValues);

  String get selectedCountry => _countriesValues[_selectedCountryKey];

  UnmodifiableListView<String> get countriesList =>
      UnmodifiableListView(_countriesValues);

  factory SettingsViewModel.of(BuildContext context) {
    Strings strings = Strings.of(context);
    var languagesValues = [
      strings.all,
      strings.arabicLanguage,
      strings.germanLanguage,
      strings.englishLanguage,
      strings.spanishLanguage,
      strings.frenchLanguage,
      strings.hebrewLanguage,
      strings.italianLanguage,
      strings.dutchLanguage,
      strings.norwegianLanguage,
      strings.portugueseLanguage,
      strings.russianLanguage,
      strings.northernSamiLanguage,
      strings.urduLanguage,
      strings.chineseLanguage
    ];
    var countriesValues = [
      strings.all,
      strings.aeCountry,
      strings.arCountry,
      strings.atCountry,
      strings.auCountry,
      strings.beCountry,
      strings.bgCountry,
      strings.brCountry,
      strings.caCountry,
      strings.chCountry,
      strings.cnCountry,
      strings.coCountry,
      strings.cuCountry,
      strings.czCountry,
      strings.deCountry,
      strings.egCountry,
      strings.frCountry,
      strings.gbCountry,
      strings.grCountry,
      strings.hkCountry,
      strings.huCountry,
      strings.idCountry,
      strings.ieCountry,
      strings.ilCountry,
      strings.inCountry,
      strings.itCountry,
      strings.jpCountry,
      strings.krCountry,
      strings.ltCountry,
      strings.lvCountry,
      strings.maCountry,
      strings.mxCountry,
      strings.myCountry,
      strings.ngCountry,
      strings.nlCountry,
      strings.noCountry,
      strings.nzCountry,
      strings.phCountry,
      strings.plCountry,
      strings.ptCountry,
      strings.roCountry,
      strings.rsCountry,
      strings.ruCountry,
      strings.saCountry,
      strings.seCountry,
      strings.sgCountry,
      strings.siCountry,
      strings.skCountry,
      strings.thCountry,
      strings.trCountry,
      strings.twCountry,
      strings.uaCountry,
      strings.usCountry,
      strings.veCountry,
      strings.zaCountry,
    ];
    var categoriesValues = [
      strings.all,
      strings.businessCategory,
      strings.entertainmentCategory,
      strings.generalCategory,
      strings.healthCategory,
      strings.scienceCategory,
      strings.sportsCategory,
      strings.technologyCategory
    ];

    return SettingsViewModel._(
      languagesValues,
      countriesValues,
      categoriesValues,
    );
  }
}
