import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';

class MyCustomBottomIcon extends StatelessWidget {
  const MyCustomBottomIcon({
    super.key,
    required Function() validOnTap,
  }) : _validOnTap = validOnTap;

  final Function() _validOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _validOnTap,
          child: Icon(Icons.check,
              color: kGreenColor, size: kSizeNormalBtn
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close,
              color: kRedColor, size: kSizeNormalBtn
          ),
        )
      ],
    );
  }
}