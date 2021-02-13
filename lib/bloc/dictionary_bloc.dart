import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidrin_yaz_dostum_app/bloc/event/dictionary_event.dart';
import 'package:nidrin_yaz_dostum_app/bloc/state/dictionary_state.dart';
import 'package:nidrin_yaz_dostum_app/repository/dictionary_repository.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictonaryDaoRepository _repository = DictonaryDaoRepository();
  final String word;
  DictionaryBloc({this.word}) : super(DictionaryInitial());

  // @override
  // Stream<Transition<DictionaryEvent, DictionaryState>> transformEvents(
  //   Stream<DictionaryEvent> events,
  //   TransitionFunction<DictionaryEvent, DictionaryState> transitionFn,
  // ) {
  //   return super.transformEvents(
  //     events.debounceTime(const Duration(milliseconds: 500)),
  //     transitionFn,
  //   );
  // }

  @override
  Stream<DictionaryState> mapEventToState(DictionaryEvent event) async* {
    final currentState = state;

    if (event is DictionaryFetched) {
      try {
        if (currentState is DictionaryInitial) {
          final dictionary = await _repository.getWord(word);

          yield DictionarySuccess(list: dictionary);
        }
        if (currentState is DictionarySuccess) {
          final dictionary = await _repository.getWord(word);

          yield DictionarySuccess(list: dictionary);
        }
      } catch (_) {
        yield DictionaryFailure(error: "Aradığınız sözcük bulunamamıştır");
      }
    }
  }
}
