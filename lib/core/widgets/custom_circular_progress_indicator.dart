import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Center(
        child: CircularProgressIndicator(
      strokeWidth: 12,
      strokeAlign: 0.8,
      strokeCap: StrokeCap.round,
      color: themeColors.primary.withAlpha(200),
      backgroundColor: Colors.grey,
    ));
  }
}
