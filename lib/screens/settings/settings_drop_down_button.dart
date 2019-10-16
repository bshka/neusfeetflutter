import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;
import 'package:nues_feet_flutter/styles/styles.dart' as Styles;

class SettingsDropDownButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  SettingsDropDownButton(
      {@required this.title, @required this.subtitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _IOSDropdownButton(
            title: title,
            subtitle: subtitle,
            onTap: onTap,
          )
        : _AndroidDropdown(
            title: title,
            subtitle: subtitle,
            onTap: onTap,
          );
  }
}

class _AndroidDropdown extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  _AndroidDropdown(
      {@required this.title, @required this.subtitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: Styles.textBold.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            subtitle,
            style: Styles.textMedium.copyWith(
              color: Colors.martini,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _IOSDropdownButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  _IOSDropdownButton(
      {@required this.title, @required this.subtitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.5,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: Styles.textBold.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            subtitle,
            style: Styles.textMedium.copyWith(
              color: Colors.martini,
              fontSize: 14,
            ),
          ),
        ],
      ),
      onPressed: onTap,
    );
  }
}
