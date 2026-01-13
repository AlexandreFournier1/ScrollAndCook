import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/texts.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> MyCustomSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: kStyleSnackBar,
        ),
        backgroundColor: kSecondColor,
      )
  );
}