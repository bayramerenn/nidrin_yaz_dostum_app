import 'package:equatable/equatable.dart';
import 'package:nidrin_yaz_dostum_app/models/header_dictionary.dart';

abstract class DictionaryState extends Equatable {
  DictionaryState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DictionaryInitial extends DictionaryState {}

class DictionarySuccess extends DictionaryState {
  final List<HeaderDictionry> list;

  DictionarySuccess({this.list});

  @override
  String toString() {
    // TODO: implement toString
    return 'PostSuccess {Dictionary :${list.length}';
  }
}

class DictionaryFailure extends DictionaryState {
  final String error;

  DictionaryFailure({this.error});
}
