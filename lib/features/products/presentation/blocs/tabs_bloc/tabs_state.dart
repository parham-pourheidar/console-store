part of 'tabs_bloc.dart';

@immutable
sealed class TabsState {
  final int index;

  const TabsState(this.index);
}

final class TabsInitial extends TabsState {
  const TabsInitial(super.index);
}

final class TabChanged extends TabsState {
  const TabChanged(super.index);
}
