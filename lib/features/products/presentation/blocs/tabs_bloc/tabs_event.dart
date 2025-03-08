part of 'tabs_bloc.dart';

@immutable
sealed class TabsEvent {}

class ChangeTab extends TabsEvent {
  final int index;

  ChangeTab(this.index);
}
