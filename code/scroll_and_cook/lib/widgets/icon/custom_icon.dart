import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';

class MyCustomIcon extends StatelessWidget {
  const MyCustomIcon({
    super.key, required IconData icon, required double size, required Function() onTap,
  }) : _icon = icon, _size = size, _onTap = onTap;

  final IconData _icon;
  final double _size;
  final Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kSmallPadding
      ),
      child: GestureDetector(
        onTap: _onTap,
        behavior: HitTestBehavior.opaque,
        child: Icon(
          _icon,
          size: _size,
        ),
      ),
    );
  }
}