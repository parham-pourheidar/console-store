import 'dart:ui';
import 'package:console_store/features/authentication/presentation/blocs/get_email_bloc/get_email_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:console_store/features/authentication/presentation/screens/get_email_screen.dart';
import 'package:console_store/features/home/presentation/screens/home_screen.dart';
import 'package:console_store/core/widgets/snack_bar_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:console_store/features/authentication/domain/use_cases/google_auth_request.dart';

import '../widgets/selector_button.dart';

class SelectorScreen extends StatelessWidget {
  const SelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: themeColors.surface,
        ),
      ),
      body: Center(
        child: Stack(children: [
          ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
              child: Image.asset(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
                'assets/images/1.jpg',
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              selectorButton(
                  backgroundColor: themeColors.primary,
                  borderColor: themeColors.onPrimary,
                  child: Center(
                      child: Text(
                    'ورود / ثبت نام',
                    style: TextStyle(
                      color: themeColors.surface,
                      fontSize: 40,
                    ),
                  )),
                  function: () async{
                    await precacheImage(AssetImage('assets/images/2.jpg'), context);
                    if (!context.mounted){
                      return;
                    }
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (ctx) => BlocProvider<GetEmailBloc>(
                              create: (context) => GetEmailBloc(),
                              child: GetEmailScreen(),
                            )));
                  }),
              selectorButton(
                  backgroundColor: themeColors.surface,
                  borderColor: themeColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/google.png'),
                        radius: 40,
                      ),
                      Text(
                        'ورود با حساب گوگل',
                        style: TextStyle(
                          color: themeColors.primary,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                  function: () async {
                    final GetIt getIt = GetIt.instance;

                    final GoogleAuthRequest googleAuthRequest =
                        getIt<GoogleAuthRequest>();

                    final bool result = await googleAuthRequest();

                    if (!context.mounted) {
                      return;
                    }

                    if (result == true) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                          (route) => false);
                    } else {
                      snackBarDisplay(
                          context: context,
                          message: "خطا در ورود! لطفا دوباره امتحان کنید");
                    }
                  })
            ],
          ),
        ]),
      ),
    );
  }
}
