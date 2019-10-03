import 'package:flutter/material.dart';
import 'package:nues_feet_flutter/screens/articles/articles_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ArticlesList(),
    );
  }
}
