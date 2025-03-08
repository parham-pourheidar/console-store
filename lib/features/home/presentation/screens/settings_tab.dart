import 'package:console_store/core/widgets/custom_circular_progress_indicator.dart';
import 'package:console_store/core/widgets/snack_bar_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/themes.dart';
import '../../../authentication/presentation/screens/selector_screen.dart';
import '../blocs/logout_bloc/logout_bloc.dart';
import '../widgets/theme_select_widget.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 15),
      child: Column(
        spacing: 25,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                ':تغییر تم برنامه',
                style: TextStyle(fontSize: 32, color: themeColors.primary),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            children: [
              ThemeSelectWidget(Themes.blueLight, 'آبی_سفید', 0),
              ThemeSelectWidget(Themes.greenLight, 'سبز_سفید', 2),
              ThemeSelectWidget(Themes.redLight, 'قرمز_سفید', 4),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            children: [
              ThemeSelectWidget(Themes.blueDark, 'آبی_مشکی', 1),
              ThemeSelectWidget(Themes.greenDark, 'سبز_مشکی', 3),
              ThemeSelectWidget(Themes.redDark, 'قرمز_مشکی', 5),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => SimpleDialog(
                        title: Text(
                          'خروج از حساب کاربری',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32, color: themeColors.onSurface),
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            textDirection: TextDirection.rtl,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'لغو کردن',
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: themeColors.onSurface),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<LogoutBloc>()
                                        .add(LogoutRequest());
                                  },
                                  child: BlocConsumer<LogoutBloc, LogoutState>(
                                    listener: (context, state) {
                                      if (state is LogoutFailed) {
                                        snackBarDisplay(
                                            context: context,
                                            message:
                                                'خطایی رخ داد مجدد امتحان کنید');
                                      } else if (state is LogoutSuccessful) {
                                        Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        SelectorScreen()),
                                                (route) => false);
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is LogoutLoading) {
                                        return CustomCircularProgressIndicator();
                                      }
                                      return Text(
                                        'خروج',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: themeColors.primary),
                                      );
                                    },
                                  )),
                            ],
                          )
                        ],
                      ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: themeColors.primary)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'خروج از حساب کاربری',
                    style: TextStyle(fontSize: 34, color: themeColors.primary),
                  ),
                  Icon(
                    Icons.exit_to_app,
                    color: themeColors.primary,
                    size: 35,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
