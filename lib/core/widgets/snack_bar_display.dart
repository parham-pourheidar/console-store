import 'package:flutter/material.dart';

void snackBarDisplay({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
      message,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    )),
  );
}
