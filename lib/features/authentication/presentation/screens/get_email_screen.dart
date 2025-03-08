import 'dart:ui';
import 'package:console_store/features/authentication/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../blocs/verify_email_bloc/verify_email_bloc.dart';
import 'verify_email_screen.dart';

import '../blocs/get_email_bloc/get_email_bloc.dart';
import '../../../../core/widgets/snack_bar_display.dart';

class GetEmailScreen extends StatefulWidget {
  const GetEmailScreen({super.key});

  @override
  State<GetEmailScreen> createState() => _GetEmailScreenState();
}

class _GetEmailScreenState extends State<GetEmailScreen> {
  late final TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                imageFilter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
                child: Image.asset(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  'assets/images/2.jpg',
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 260, 12, 90),
                  child: Column(
                    spacing: 5,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            ':ایمیل',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          )),
                      TextField(
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w300,
                              color: themeColors.onSurface.withAlpha(180)),
                          hintText: 'example@gmail.com',
                          hintFadeDuration: Duration(milliseconds: 500),
                          suffixIcon: Icon(Icons.email_rounded),
                          fillColor: themeColors.surface,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: themeColors.primary, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: themeColors.primary.withAlpha(180),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 65,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white24,
                              spreadRadius: 2.5,
                              blurRadius: 2.5,
                              offset: Offset(0, 2))
                        ],
                        color: themeColors.primary.withBlue(90),
                        border: Border.all(
                            color: themeColors.onPrimary, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: BlocConsumer<GetEmailBloc, GetEmailState>(
                      listener: (context, state) {
                        if (state is SentState) {
                          snackBarDisplay(
                              context: context,
                              message:
                                  'ایمیل ارسال شد! لطفاً صندوق ورودی خود را بررسی کنید');

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider<TimerBloc>(
                                      create: (context) => TimerBloc()),
                                  BlocProvider<GetEmailBloc>(
                                      create: (context) => GetEmailBloc()),
                                  BlocProvider<VerifyEmailBloc>(
                                      create: (context) => VerifyEmailBloc()),
                                ],
                                child: VerifyEmailScreen(
                                  email: emailController.text,
                                ),
                              ),
                            ),
                          );
                        } else if (state is ErrorState) {
                          snackBarDisplay(
                              context: context, message: 'خطا در ارسال ایمیل');
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return CustomCircularProgressIndicator();
                        } else {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<GetEmailBloc>(context).add(
                                  SendRequestToServer(emailController.text));
                            },
                            child: Center(
                                child: Text(
                              'ارسال کد تایید',
                              style: TextStyle(
                                color: themeColors.surface,
                                fontSize: 35,
                              ),
                            )),
                          );
                        }
                      },
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
