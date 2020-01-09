import 'package:flutter/material.dart';

final SliverAppBar nytAppBar = SliverAppBar(
  backgroundColor: Colors.white,
  expandedHeight: 170,
  flexibleSpace: FlexibleSpaceBar(
    background: Stack(
      children: <Widget>[
        Container(
          height: 170.0,
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
              fontSize: 60.0,
              letterSpacing: 1.0,
              color: Colors.white,
              fontFamily: 'Anton',
            ),
          ),
        ),
      ],
    ),
  ),
);
