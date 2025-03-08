import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    Future.microtask(() => add(ResetTimer()));
    on<ResetTimer>((event, emit) async{
      for (var i = 1; i< 60; i++){
        emit(TimerRunning(i));
        await Future.delayed(Duration(seconds: 1));
      }
      emit(TimerEnd());
      // });
    });
  }
}
