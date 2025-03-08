import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/config/themes.dart';

part 'change_theme_event.dart';
part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  static ThemeData getInitialTheme(int index) {
    switch (index) {
      case 0:
        return Themes.blueLight;
      case 1:
        return Themes.blueDark;
      case 2:
        return Themes.greenLight;
      case 3:
        return Themes.greenDark;
      case 4:
        return Themes.redLight;
      case 5:
        return Themes.redDark;
      default:
        return Themes.blueLight;
    }
  }

  ChangeThemeBloc(int themeNumber)
      : super(ChangeThemeInitial(getInitialTheme(themeNumber))) {
    on<ChangeTheme>((event, emit) async {
      final SharedPreferences prefs =
          await SharedPreferences.getInstance();
      await prefs.setInt('theme_index', event.themeNumber);
      switch (event.themeNumber) {
        case 0:
          emit(ChangedTheme(Themes.blueLight));
        case 1:
          emit(ChangedTheme(Themes.blueDark));
        case 2:
          emit(ChangedTheme(Themes.greenLight));
        case 3:
          emit(ChangedTheme(Themes.greenDark));
        case 4:
          emit(ChangedTheme(Themes.redLight));
        case 5:
          emit(ChangedTheme(Themes.redDark));

      }
    });
  }
}
