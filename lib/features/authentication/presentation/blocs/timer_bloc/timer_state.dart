part of 'timer_bloc.dart';

@immutable
sealed class TimerState {}
class TimerInitial extends TimerState {}
class TimerRunning extends TimerState{
  final int second;

  TimerRunning(this.second);
}
class TimerEnd extends TimerState{}
