import 'package:flutter/material.dart';
import 'package:flutter_news_web_page/src/Bloc/sections_bloc.dart';

class SectionTab extends StatelessWidget {
  final String section;
  final SectionsBloc bloc;
  const SectionTab({@required this.section, @required this.bloc, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: GestureDetector(
        child: Center(
          child: Text(
            "${section[0].toUpperCase()}${section.substring(1)}",
            style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        onTap: () => bloc.changeSection(section),
      ),
    );
  }
}
