import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;
import 'package:nues_feet_flutter/styles/images.dart' as Images;
import 'package:nues_feet_flutter/styles/styles.dart' as Styles;

import 'bookmark_button.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final Function onTap;
  final Function onBookmark;

  ArticleCard(this.article,
      {Key key, @required this.onTap, @required this.onBookmark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: InkResponse(
        onTap: onTap,
        child: Card(
          elevation: Platform.isIOS ? 2 : 2,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Hero(
                  tag: 'image' + article.toString(),
                  child: FadeInImage.assetNetwork(
                    height: 190,
                    placeholder: Images.kPlaceholder,
                    image: article.urlToImage ?? '',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 100),
                    fadeOutDuration: Duration(milliseconds: 100),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            article.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.kTextMedium.copyWith(
                              color: Colors.kBlack,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          child: BookmarkButton(
                            onTap: onBookmark,
                            addedToBookmarks: article.localId != null,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          article.sourceName != null
                              ? article.sourceName.toUpperCase()
                              : '',
                          style: Styles.kTextRegular.copyWith(
                            color: Colors.kMartini,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            DateFormat('dd.MM.yyyy')
                                .format(article.publishedAt ?? DateTime.now()),
                            style: Styles.kTextLight.copyWith(
                              color: Colors.kFrenchGray,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      article.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.kTextLight.copyWith(
                        color: Colors.kManatee,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
