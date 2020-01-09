import 'package:flutter_news_web_page/src/components/nyt_sliver_app_bar.dart';
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
    'home',
    'science',
    'politics',
    'books',
    'arts',
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
      body: CustomScrollView(
        slivers: [
          nytAppBar,
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 50.0,
                  child: Row(
                    children: tabs,
                  ),
                ),
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
