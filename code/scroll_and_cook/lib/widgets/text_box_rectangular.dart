import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class RectangularTextBox extends StatelessWidget {
  const RectangularTextBox({
    super.key,
    required String title,
    required Color color,
    required AlignmentGeometry align,
    required double leftpad,
  }) : _title = title, _color = color, _align = align, _leftpaf = leftpad;

  final String _title;
  final Color _color;
  final AlignmentGeometry _align;
  final double _leftpaf;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: _leftpaf),
      child: Align(
        alignment: _align,
        child: Container(
          decoration: BoxDecoration(
            color: _color,
            borderRadius: kMinimalRadius,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: kLeftPaddingTextBoxRectangular, right: kRightPaddingTextBoxRectangular , top: kTopPaddingTextBoxRectangular, bottom: kBottomPaddingTextBoxRectangular),
            child: Text(
              _title,
              style: kTextTextInput,
            ),
          ),
        ),
      ),
    );
  }
}