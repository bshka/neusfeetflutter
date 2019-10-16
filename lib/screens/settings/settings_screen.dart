import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/screens/settings/settings_drop_down_button.dart';
import 'package:nues_feet_flutter/screens/settings/settings_view_model.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    setState(() {
      _viewModel = SettingsViewModel.of(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: SettingsDropDownButton(
                  title: Strings.of(context).country,
                  subtitle: _viewModel?.selectedCountry ?? '',
                  onTap: () {
                    // TODO
                  },
                ),
              ),
              Expanded(
                child: SettingsDropDownButton(
                  title: Strings.of(context).language,
                  subtitle: _viewModel?.selectedLanguage ?? '',
                  onTap: () {
                    // TODO
                  },
                ),
              ),
              Expanded(
                child: SettingsDropDownButton(
                  title: Strings.of(context).category,
                  subtitle: _viewModel?.selectedCategory ?? '',
                  onTap: () {
                    // TODO
                  },
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
