import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/model/article_model.dart';
import 'package:nues_feet_flutter/screens/articles/article_card.dart';

class ArticlesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var article = Article(
      title: 'Quick Brown Fox Jumps Over',
      url: null,
      author: null,
      content: null,
      description:
          'Synth polaroid bitters chillwave pickled. Vegan disrupt tousled, Portland keffiyeh aesthetic food',
      localId: null,
      publishedAt: null,
      sourceId: null,
      sourceName: 'Google News',
      urlToImage: null,
    );
    return Container(
      child: ArticleCard(
        article,
        onTap: () {},
        onBookmark: () {},
      ),
    );
  }
}
