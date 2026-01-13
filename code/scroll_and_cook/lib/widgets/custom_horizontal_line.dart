import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';

class CustomHorizontalLine extends StatelessWidget {
  const CustomHorizontalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kBigPadding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: kSizeHorizontalLine,
        child: Container(
          decoration: BoxDecoration(
              color: kBlackColor
          ),
        ),
      ),
    );
  }
}