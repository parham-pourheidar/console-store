import 'dart:ui';
import 'package:console_store/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:console_store/features/authentication/presentation/blocs/get_email_bloc/get_email_bloc.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../blocs/timer_bloc/timer_bloc.dart';
import '../blocs/verify_email_bloc/verify_email_bloc.dart';
import '../widgets/custom_pin_theme.dart';
import '../../../../core/widgets/snack_bar_display.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

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
        child: SingleChildScrollView(
          child: Stack(children: [
            ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                child: Image.asset(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  'assets/images/3.jpg',
                )),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                  child: Pinput(
                    onCompleted: (token) async {
                      BlocProvider.of<VerifyEmailBloc>(context)
                          .add(VerifyRequest(token, email));
                    },
                    defaultPinTheme: customPinTheme(
                        themeColors: themeColors,
                        borderWidth: 1.3,
                        borderRadius: 10),
                    focusedPinTheme: customPinTheme(
                        themeColors: themeColors,
                        borderWidth: 1.3,
                        borderRadius: 10),
                    followingPinTheme: customPinTheme(
                        themeColors: themeColors,
                        borderWidth: 1,
                        borderRadius: 20),
                    submittedPinTheme: customPinTheme(
                        themeColors: themeColors,
                        borderWidth: 2,
                        borderRadius: 20),
                    length: 6,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    if (state is TimerRunning) {
                      return TextButton(
                          onPressed: () async {
                            snackBarDisplay(
                                context: context,
                                message: 'لطفا تا پایان 60 ثانیه منتظر بمانید');
                          },
                          child: Text(
                            'ارسال مجدد کد : ${60 - state.second} ثانیه',
                            style: TextStyle(fontSize: 28),
                          ));
                    }
                    return TextButton(
                        onPressed: () async {
                          BlocProvider.of<GetEmailBloc>(context)
                              .add(SendRequestToServer(email));
                        },
                        child: Text(
                          'ارسال مجدد کد',
                          style: TextStyle(fontSize: 28),
                        ));
                  },
                ),
                BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
                    builder: (context, state) {
                  if (state is VerifyRequesting) {
                    return CustomCircularProgressIndicator();
                  } else {
                    return SizedBox();
                  }
                }, listener: (context, state) {
                  if (state is TokenRight) {
                    imageCache.evict(AssetImage('assets/images/2.jpg'));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                        (route) => false);
                  } else if (state is TokenWrong) {
                    snackBarDisplay(
                        context: context, message: 'خطا! مجددا امتحان کنید');
                  }
                }),
                BlocConsumer<GetEmailBloc, GetEmailState>(
                    builder: (context, state) {
                  if (state is LoadingState) {
                    return CustomCircularProgressIndicator();
                  } else {
                    return SizedBox();
                  }
                }, listener: (context, state) {
                  if (state is SentState) {
                    snackBarDisplay(
                        context: context,
                        message:
                            'ایمیل ارسال شد! لطفاً صندوق ورودی خود را بررسی کنید');
                    BlocProvider.of<TimerBloc>(context).add(ResetTimer());
                  } else if (state is ErrorState) {
                    snackBarDisplay(
                        context: context, message: 'خطا در ارسال ایمیل');
                  }
                })
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
