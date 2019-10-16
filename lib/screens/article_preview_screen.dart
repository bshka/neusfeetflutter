import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nues_feet_flutter/i18n/strings.dart';
import 'package:nues_feet_flutter/main.dart';
import 'package:nues_feet_flutter/model/article.dart';
import 'package:nues_feet_flutter/styles/colors.dart' as Colors;
import 'package:nues_feet_flutter/styles/images.dart' as Images;
import 'package:nues_feet_flutter/styles/styles.dart' as Styles;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'articles/bookmark_button.dart';

class ArticlePreviewScreen extends StatefulWidget {
  final Article _article;

  ArticlePreviewScreen(this._article);

  @override
  _ArticlePreviewScreenState createState() =>
      _ArticlePreviewScreenState(_article);
}

class _ArticlePreviewScreenState extends State<ArticlePreviewScreen> {
  Article _article;
  bool _addedToBookmarks;

  _ArticlePreviewScreenState(this._article) {
    _addedToBookmarks = _article.localId != null;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => DataProvider(),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 330,
              primary: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Hero(
                  tag: 'image' + _article.toString(),
                  child: FadeInImage.assetNetwork(
                    height: 190,
                    placeholder: Images.placeholder,
                    image: _article.urlToImage ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.alabaster,
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
                            style: Styles.textMedium.copyWith(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          child: BookmarkButton(
                            onTap: _onBookmarkClicked,
                            addedToBookmarks: _addedToBookmarks,
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
                          style: Styles.textRegular.copyWith(
                            color: Colors.martini,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            DateFormat('dd.MM.yyyy')
                                .format(_article.publishedAt ?? DateTime.now()),
                            style: Styles.textLight.copyWith(
                              color: Colors.frenchGray,
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
                      style: Styles.textLight.copyWith(
                        color: Colors.manatee,
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
      ),
    );
  }

  void _onReadArticle() async {
    if (await canLaunch(_article.url)) {
      await launch(_article.url);
    }
  }

  void _onBookmarkClicked() async {
    if (_article.localId == null) {
      int id =
      await DataProvider.of(context).addRemoveBookmarkUseCase.add(_article);
      setState(() {
        _article = widget._article.copyWith(localId: id);
      });
    } else {
      await DataProvider.of(context).addRemoveBookmarkUseCase.remove(_article);
      setState(() {
        _article = widget._article.copyWith(localId: null);
      });
    }
  }

  Widget _openArticle(context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        color: Colors.black,
        borderRadius: BorderRadius.circular(22),
        pressedOpacity: 0.5,
        child: Text(
          Strings.of(context).readArticle.toUpperCase(),
          style: Styles.textMedium.copyWith(
            color: Colors.white,
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
        color: Colors.black,
        onPressed: _onReadArticle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.of(context).readArticle.toUpperCase(),
              style: Styles.textMedium.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      );
    }
  }
}
