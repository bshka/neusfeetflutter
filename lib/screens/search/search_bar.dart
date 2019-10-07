import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/screens/articles/articles_list.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Platform.isIOS ? _iOSTextField() : _androidTextField(),
    );
  }

  void _onTextChanged(String query) {
    ArticlesListProvider.of(context).search(query);
  }

  Widget _androidTextField() {
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        height: 40,
        child: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.kMartini,
            ),
            hintStyle: TextStyle(
              color: Colors.kMartini,
            ),
            hintText: Strings.of(context).searchHint,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: _onTextChanged,
        ),
      ),
    );
  }

  Widget _iOSTextField() {
    return Container(
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          )
        ],
        color: Colors.kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: CupertinoTextField(
        onChanged: _onTextChanged,
        maxLines: 1,
        autofocus: false,
        autocorrect: true,
        textInputAction: TextInputAction.search,
        prefix: Icon(
          Icons.search,
          color: Colors.kMartini,
        ),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
