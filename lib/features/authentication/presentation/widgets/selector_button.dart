import 'package:flutter/material.dart';

Widget selectorButton(
    {required Color backgroundColor,
    required Color borderColor,
    required Widget child,
    required dynamic function}) {
  return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white24,
                spreadRadius: 2.5,
                blurRadius: 2.5,
                offset: Offset(0, 2))
          ],
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: InkWell(onTap: function, child: child));
}
