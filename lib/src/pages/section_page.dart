import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/Bloc/sections_bloc.dart';
import 'package:flutter_news_web_page/src/helpers/responsive_helpers.dart';
import 'package:flutter_news_web_page/src/models/article_model.dart';
import 'package:flutter_news_web_page/src/services/api_service.dart';
import 'package:flutter_news_web_page/src/widgets/articles_grid.dart';

class SectionPage extends StatefulWidget {
  final String _section;
  final SectionsBloc bloc;
  SectionPage(this._section, {@required this.bloc, key}) : super(key: key);

  @override
  _SectionPageState createState() => _SectionPageState(_section, bloc);
}

class _SectionPageState extends State<SectionPage> {
  List<Article> _articles = [];
  final SectionsBloc _bloc;
  final String _section;
  _SectionPageState(this._section, this._bloc);

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
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Error, try again',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () => _bloc.changeSection(_section),
                  )
                ],
              ),
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
