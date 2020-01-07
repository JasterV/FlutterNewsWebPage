import 'package:flutter_news_web_page/src/components/article_tile.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';
import 'package:flutter_news_web_page/src/models/article_model.dart';
import 'package:flutter_news_web_page/src/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> _articles = [];

  @override
  void initState() {
    _fetchArticles();
    super.initState();
  }

  Future _fetchArticles() async {
    List<Article> articles = await APIService.fetchArticlesBySection('home');
    setState(() {
      _articles = articles;
    });
  }

  Widget _buildArticlesGrid(MediaQueryData mediaQuery) {
    List<GridTile> tiles = _articles
        .map((article) => buildArticleTile(article, article.url, mediaQuery))
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

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Text(
                'New York Times',
                style: TextStyle(
                  fontFamily: 'Chomsky',
                  fontSize: 50.0,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Top news',
              style: TextStyle(fontSize: 40.0, fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: responsivePadding(mediaQuery),
            child: _articles.length > 0
                ? _buildArticlesGrid(mediaQuery)
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
