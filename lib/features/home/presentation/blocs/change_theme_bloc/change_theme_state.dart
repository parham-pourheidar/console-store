part of 'change_theme_bloc.dart';

@immutable
sealed class ChangeThemeState {
  final ThemeData currentTheme;

  const ChangeThemeState(this.currentTheme);
}

class ChangeThemeInitial extends ChangeThemeState {
  const ChangeThemeInitial(super.currentTheme);
}
class ChangedTheme extends ChangeThemeState {
  const ChangedTheme(super.currentTheme);
}
