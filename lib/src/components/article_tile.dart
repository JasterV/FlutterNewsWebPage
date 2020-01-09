import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';
import 'package:flutter_news_web_page/src/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

GridTile articleTile(Article article, String url, MediaQueryData mediaQuery) {
    return GridTile(
      child: GestureDetector(
        onTap: () => _launchUrl(article.url),
        child: Column(
          children: <Widget>[
            Container(
              height: responsiveImageHeight(mediaQuery),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: NetworkImage(article.imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(10, 10),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              height: responsiveTitleHeight(mediaQuery),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(10, 10),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _launchUrl(String url) async {
    if (await canLaunch(url))
      launch(url);
    else
      throw 'Could not launch $url';
  }