import 'dart:async';
import 'package:rxdart/rxdart.dart';

class SectionsBloc{
  final BehaviorSubject<String> _subject = BehaviorSubject();

  SectionsBloc(){
    _subject.onListen = (){
      _subject.add('home');
    };
  }

  Function(String) get changeSection => _subject.add;
  Stream<String> get section => _subject.stream;

  dispose(){
    _subject.close();
  }  
}