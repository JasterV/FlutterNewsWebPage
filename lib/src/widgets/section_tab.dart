import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/Bloc/sections_bloc.dart';

class SectionTab extends StatelessWidget {
  final String section;
  final SectionsBloc bloc;
  const SectionTab({@required this.section, @required this.bloc, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.grey[600], width: 0.5),
              left: BorderSide(color: Colors.grey[600], width: 0.5),
              bottom: BorderSide(color: Colors.grey[600], width: 0.5),
            ),
          ),
          child: Center(
            child: Text(
              section,
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
          ),
        ),
        onTap: () => bloc.changeSection(section),
      ),
    );
  }
}
