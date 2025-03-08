import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

PinTheme customPinTheme(
    {required ColorScheme themeColors,
    required double borderWidth,
    required double borderRadius}) {
  return PinTheme(
      width: 54,
      height: 55,
      textStyle: TextStyle(
          fontSize: 30,
          color: themeColors.primary,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: themeColors.surface.withAlpha(140),
        border: Border.all(color: themeColors.primary, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ));
}
