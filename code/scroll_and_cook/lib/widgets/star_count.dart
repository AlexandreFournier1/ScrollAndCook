import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/size.dart';

class StarCount extends StatelessWidget {
  const StarCount({
    super.key,
    required int count,
  }) : _count = count;

  final int _count;

  @override
  Widget build(BuildContext context) {
    return Row(
      // pour center
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _count; i++)
          Icon(
            Icons.star,
            size: kIconSize - 5,
          ),
      ],
    );
  }
}
