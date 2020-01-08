import 'dart:ui';

import 'package:flutter_news_web_page/src/pages/section_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
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
              ),
              SliverPersistentHeader(
                floating: true,
                delegate: _SliverAppBarDelegate(
                  tabBar: TabBar(
                    indicatorColor: Colors.grey[800],
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.home, color: Colors.grey[800]),
                      ),
                      Tab(
                        icon: Icon(Icons.local_drink, color: Colors.grey[800]),
                      ),
                      Tab(
                        icon: Icon(Icons.fastfood, color: Colors.grey[800]),
                      ),
                      Tab(
                        icon: Icon(Icons.person, color: Colors.grey[800]),
                      ),
                      Tab(
                        icon: Icon(Icons.art_track, color: Colors.grey[800]),
                      ),
                      Tab(
                        icon: Icon(Icons.book, color: Colors.grey[800]),
                      ),
                      Tab(
                        icon: Icon(Icons.tablet_mac, color: Colors.grey[800]),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              TopPage('home'),
              TopPage('science'),
              TopPage('food'),
              TopPage('politics'),
              TopPage('arts'),
              TopPage('books'),
              TopPage('technology'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({@required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: Material(
        color: Colors.white70,
        child: tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
