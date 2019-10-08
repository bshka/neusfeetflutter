import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;
import 'package:nues_feet_flutter/styles/images.dart' as Images;
import 'package:nues_feet_flutter/styles/styles.dart' as Styles;
import 'package:url_launcher/url_launcher.dart';

import 'articles/bookmark_button.dart';

class ArticlePreviewScreen extends StatelessWidget {
  final Article _article;

  void _onBookmark() {
    // TODO add to the database
  }

  void _onReadArticle() async {
    if (await canLaunch(_article.url)) {
      await launch(_article.url);
    }
  }

  ArticlePreviewScreen(this._article);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 330,
            primary: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: FadeInImage.assetNetwork(
                height: 190,
                placeholder: Images.kPlaceholder,
                image: _article.urlToImage ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: Container(
        color: Colors.kAlabaster,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _article.title ?? '',
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
                          onTap: _onBookmark,
                          addedToBookmarks: false, // TODO
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _article.sourceName != null
                            ? _article.sourceName.toUpperCase()
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
                          DateFormat('dd MM yyyy')
                              .format(_article.publishedAt ?? DateTime.now()),
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
                    _article.description ?? '',
                    style: Styles.kTextLight.copyWith(
                      color: Colors.kManatee,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: _openArticle(context),
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
    );
  }

  Widget _openArticle(context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        color: Colors.kBlack,
        borderRadius: BorderRadius.circular(22),
        pressedOpacity: 0.5,
        child: Text(
          Strings.of(context).readArticle.toUpperCase(),
          style: Styles.kTextMedium.copyWith(
            color: Colors.kWhite,
            fontSize: 12,
          ),
        ),
        onPressed: _onReadArticle,
      );
    } else {
      return MaterialButton(
        padding: EdgeInsets.all(0),
        height: 44,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        color: Colors.kBlack,
        onPressed: _onReadArticle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.of(context).readArticle.toUpperCase(),
              style: Styles.kTextMedium.copyWith(
                color: Colors.kWhite,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.kWhite,
            )
          ],
        ),
      );
    }
  }
}
