import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nidrin_yaz_dostum_app/bloc/event/timer_event.dart';
import 'package:nidrin_yaz_dostum_app/bloc/state/timer_state.dart';
import 'package:nidrin_yaz_dostum_app/util/ticker/ticker.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  int duration = 0;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker, this.duration})
      : assert(ticker != null),
        _ticker = ticker,
        super(TimerInitial(duration));

  @override
  void onTransition(Transition<TimerEvent, TimerState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerResumed) {
      print("restart");
      yield* _mapTimerResumedToState(event);
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    } else if (event is TimerPaused) {
      print("TimerPaused");
      yield* _mapTimerPausedToState(event);
    }
  }

  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<TimerState> _mapTimerStartedToState(TimerStarted start) async* {
    yield TimerRunInProgress(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
    print(state);
  }

  Stream<TimerState> _mapTimerRestartToState(TimerResumed restart) async* {
    _tickerSubscription?.cancel();
    yield TimerInitial(state.duration);
  }

  Stream<TimerState> _mapTimerPausedToState(TimerPaused pause) async* {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      yield TimerRunPause(state.duration);
    }
  }

  Stream<TimerState> _mapTimerResumedToState(TimerResumed resume) async* {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      yield TimerRunInProgress(state.duration);
    }
  }

  Stream<TimerState> _mapTimerResetToState(TimerReset reset) async* {
    _tickerSubscription?.cancel();
    yield* _mapTimerStartedToState(TimerStarted(duration: duration));
  }

  Stream<TimerState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield tick.duration > 0
        ? TimerRunInProgress(tick.duration)
        : TimerRunComplete();
  }
}
