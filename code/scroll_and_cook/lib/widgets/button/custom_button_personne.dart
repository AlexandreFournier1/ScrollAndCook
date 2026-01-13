import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class MyCustomButtonNbPersonne extends StatelessWidget {
  const MyCustomButtonNbPersonne({
    super.key, required IconData icon, required Function() onTapFunction,
  }) : _icon = icon, _onTapFunction = onTapFunction;

  final IconData _icon;
  final Function() _onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kNormalPadding),
      child: GestureDetector(
        onTap: _onTapFunction,
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: kMinimalRadius,
              color: kSecondColor
          ),
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(kNormalPadding),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kVerySmallPadding
                  ),
                  child: Icon(
                    _icon,
                    size: kSizeMediumBtn,
                  ),
                ),
                Text(
                    "personnes",
                    style: kSecondTextRecetteScreen
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}