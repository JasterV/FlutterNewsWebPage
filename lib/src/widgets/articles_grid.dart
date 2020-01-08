import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/components/article_tile.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';
import 'package:flutter_news_web_page/src/models/article_model.dart';

class ArticlesGrid extends StatelessWidget {
  List<Article> _articles;
  ArticlesGrid(this._articles);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    List<GridTile> tiles = _articles
        .map((article) => articleTile(article, article.url, mediaQuery))
        .toList();
    return GridView.count(
      crossAxisCount: responsiveNumGridTiles(mediaQuery),
      mainAxisSpacing: 30.0,
      crossAxisSpacing: 30.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: tiles,
    );
  }
}
