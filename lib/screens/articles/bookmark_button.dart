import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;

class BookmarkButton extends StatelessWidget {
  final Function onTap;
  final bool addedToBookmarks;

  BookmarkButton({this.onTap, this.addedToBookmarks});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _BookmarkButtoniOS(onTap, addedToBookmarks)
        : _BookmarkButtonAndroid(onTap, addedToBookmarks);
  }
}

class _BookmarkButtonAndroid extends StatelessWidget {
  final Function onTap;
  final bool addedToBookmarks;

  _BookmarkButtonAndroid(this.onTap, this.addedToBookmarks);

  @override
  Widget build(BuildContext context) {

    return InkResponse(
      child: Icon(
        addedToBookmarks ? Icons.bookmark : Icons.bookmark_border,
        size: 24,
      ),
      onTap: onTap,
    );
  }
}

class _BookmarkButtoniOS extends StatelessWidget {
  final Function onTap;
  final bool addedToBookmarks;

  _BookmarkButtoniOS(this.onTap, this.addedToBookmarks);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        pressedOpacity: 0.5,
        child: Icon(
          addedToBookmarks ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.black,
          size: 24,
        ),
        onPressed: onTap);
  }
}
