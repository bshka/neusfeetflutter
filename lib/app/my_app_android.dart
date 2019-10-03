import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;

class MyAppAndroid extends StatelessWidget {
  final Widget home;

  MyAppAndroid(this.home);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.kPrimary,
        primaryColorDark: Colors.kPrimaryDark,
        accentColor: Colors.kAccent,
      ),
      onGenerateTitle: (context) => Strings.of(context).appName,
      localizationsDelegates: [
        const AppStringsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      home: home,
    );
  }
}
