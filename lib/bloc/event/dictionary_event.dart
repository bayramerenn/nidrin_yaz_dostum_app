import 'package:equatable/equatable.dart';

abstract class DictionaryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DictionaryFetched extends DictionaryEvent {}
