import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;

class MyAppiOS extends StatelessWidget {
  final Widget home;

  MyAppiOS(this.home);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoTheme.of(context).copyWith(
        primaryColor: Colors.primary,
        primaryContrastingColor: Colors.primaryDark,
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
