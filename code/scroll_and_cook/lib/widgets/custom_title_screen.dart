import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class MyTitleScreen extends StatelessWidget {
  const MyTitleScreen({
    super.key,
    required String title,
    required Color color,
  }) : _title = title, _color = color;

  final String _title;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kPaddingCustomTitleScreen
        ),
        child: Container(
          decoration: BoxDecoration(
              color: _color,
              borderRadius: kMinimalRadius
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(kNormalPadding),
              child: Text(
                _title,
                style: kTitle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}