import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required Function() onTapFunction,
    required String label,
    TextStyle? style,
    bool? boxShadowDisable}) : _onTapFunction = onTapFunction, _label = label, _style = style, _boxShadowDisable = boxShadowDisable;

  final Function() _onTapFunction;
  final String _label;
  final TextStyle? _style;
  final bool? _boxShadowDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTapFunction,
      child: Container(
        decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: kNormalRadius,
            boxShadow: _boxShadowDisable == true ? [kBoxShadowDisabled] : [kBoxShadow]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kButtonHorizontalPadding,
              vertical: kButtonVerticalPadding
          ),
          child: Text(
            _label,
            style: _style ?? kTextButton
          ),
        ),
      ),
    );
  }
}
