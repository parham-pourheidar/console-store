part of 'change_theme_bloc.dart';

@immutable
sealed class ChangeThemeEvent {}
class ChangeTheme extends ChangeThemeEvent {
  final int themeNumber;

  ChangeTheme(this.themeNumber);
}
