import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/change_theme_bloc/change_theme_bloc.dart';

class ThemeSelectWidget extends StatelessWidget {
  const ThemeSelectWidget(this.themeData, this.title, this.index, {super.key});

  final ThemeData themeData;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, color: themeData.colorScheme.primary),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: () async {
            BlocProvider.of<ChangeThemeBloc>(context).add(ChangeTheme(index));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration:
                themeData == context.watch<ChangeThemeBloc>().state.currentTheme
                    ? BoxDecoration(
                        border: Border.all(
                            color: themeData.colorScheme.primary, width: 2),
                        borderRadius: BorderRadius.circular(22))
                    : BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 0.3),
                        borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20)),
                        color: themeData.colorScheme.primary,
                      ),
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20)),
                        color: themeData.colorScheme.onSurface,
                      ),
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20)),
                        color: themeData.colorScheme.surface,
                      ),
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(20)),
                        color: themeData.colorScheme.secondary,
                      ),
                      width: 50,
                      height: 50,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
