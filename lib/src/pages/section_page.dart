import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';
import 'package:flutter_news_web_page/src/models/article_model.dart';
import 'package:flutter_news_web_page/src/services/api_service.dart';
import 'package:flutter_news_web_page/src/widgets/articles_grid.dart';

class TopPage extends StatefulWidget {
  final String _section;
  TopPage(this._section, {Key key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState(_section);
}

class _TopPageState extends State<TopPage> {
  List<Article> _articles = [];
  final String _section;
  _TopPageState(this._section);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: responsivePadding(mediaQuery),
      child: FutureBuilder(
        future: APIService.fetchArticles(_section),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _articles = snapshot.data;
            return ArticlesGrid(_articles);
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error, please try again'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
