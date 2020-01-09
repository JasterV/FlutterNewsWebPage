import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';


class FlexibleBar extends StatelessWidget {
  const FlexibleBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
    background: Stack(
      children: <Widget>[
        Container(
          height: responsiveBarHeight(MediaQuery.of(context)),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/city_bg.png'),
            ),
          ),
        ),
        Center(
          child: Text(
            'NYTimes Top Articles',
            style: TextStyle(
              fontSize: responsivePageTitleHeight(MediaQuery.of(context)),
              letterSpacing: 1.0,
              color: Colors.white,
              fontFamily: 'Anton',
            ),
          ),
        ),
      ],
    ),
  );
  }
}