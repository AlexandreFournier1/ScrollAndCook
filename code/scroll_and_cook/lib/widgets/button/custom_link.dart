import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class CustomLink extends StatelessWidget {
  const CustomLink({super.key, required Function() onTapFunction, required String label}) : _onTapFunction = onTapFunction, _label = label;

  final Function() _onTapFunction;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTapFunction,
      child: Padding(
        padding: const EdgeInsets.all(kNormalPadding),
        child: Text(
          _label,
          style: kTextLink,
        ),
      ),
    );
  }
}
