import 'package:flutter/gestures.dart';
import 'package:flutter_news_web_page/src/components/flexible_space_nyt_bar.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';
import 'package:flutter_news_web_page/src/pages/section_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/widgets/section_tab.dart';
import '../Bloc/sections_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SectionsBloc bloc = SectionsBloc();
  List<String> sections = [
    "home",
    "arts",
    "automobiles",
    "books",
    "business",
    "fashion",
    "food",
    "health",
    "insider",
    "magazine",
    "movies",
    "national",
    "nyregion",
    "obituaries",
    "opinion",
    "politics",
    "realestate",
    "science",
    "sports",
    "sundayreview",
    "technology",
    "theater",
    "tmagazine",
    "travel",
    "upshot",
    "world"
  ];

  List<Widget> tabs;

  @override
  void initState() {
    tabs = sections
        .map((section) => SectionTab(section: section, bloc: bloc))
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black54,
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: Drawer(
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index){
            return tabs[index];
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black54,
            expandedHeight: responsiveBarHeight(MediaQuery.of(context)),
            flexibleSpace: FlexibleBar(),
            actions: <Widget>[
              Center(child: Text('Search articles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  iconSize: 35.0,
                  onPressed: () => null,
                  icon: Icon(Icons.search),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                StreamBuilder(
                  stream: bloc.section,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SectionPage(
                        snapshot.data,
                        bloc: bloc,
                        key: UniqueKey(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
