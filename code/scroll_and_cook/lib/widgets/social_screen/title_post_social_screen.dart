import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class TitlePostSocialScreen extends StatelessWidget {
  const TitlePostSocialScreen({
    super.key,
    required String title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            right: kBigPadding,
            top: kNormalPadding,
            bottom: kNormalPadding
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: kMinimalRadius,
              color: kWhiteColor
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kLargePadding,
                vertical: kNormalPadding
            ),
            child: Text(
              _title,
              style: kPostTitle,
            ),
          ),
        ),
      ),
    );
  }
}