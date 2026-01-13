import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class MyRecetteLine extends StatelessWidget {
  const MyRecetteLine({
    super.key, required int number, required String text,
  }) : _number = number, _text = text;

  final int _number;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kLargePadding,
          vertical: kNormalPadding
      ),
      child: Row(
        children: [
          Text("$_number.", style: kMainTextRecetteScreen,),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kNormalPadding
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                _text,
                style: kSecondTextRecetteScreen,
                softWrap: true,
                maxLines: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}