part of 'timer_bloc.dart';

@immutable
sealed class TimerEvent {}

class ResetTimer extends TimerEvent{}
