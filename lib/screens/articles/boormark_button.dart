import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;

class BookmarkButton extends StatelessWidget {
  final Function onTap;

  BookmarkButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _BookmarkButtoniOS(onTap)
        : _BookmarkButtonAndroid(onTap);
  }
}

class _BookmarkButtonAndroid extends StatelessWidget {
  final Function onTap;

  _BookmarkButtonAndroid(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Icon(
        Icons.bookmark_border,
        size: 24,
      ),
      onTap: onTap,
    );
  }
}

class _BookmarkButtoniOS extends StatelessWidget {
  final Function onTap;

  _BookmarkButtoniOS(this.onTap);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        pressedOpacity: 0.5,
        child: Icon(
          Icons.bookmark_border,
          color: Colors.kBlack,
          size: 24,
        ),
        onPressed: onTap);
  }
}
