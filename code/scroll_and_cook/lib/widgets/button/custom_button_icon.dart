import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({super.key, required Function() onTapFunction, required IconData icon, required Color color, bool? boxShadowDisable}) : _onTapFunction = onTapFunction, _icon = icon, _color = color, _boxShadowDisable = boxShadowDisable;

  final Function() _onTapFunction;
  final IconData _icon;
  final Color _color;
  final bool? _boxShadowDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTapFunction,
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: kMiniRadius,
          boxShadow: _boxShadowDisable == true ? [kBoxShadowDisabled] : [kBoxShadow],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kNormalPadding,
              vertical: kNormalPadding
          ),
          child: Icon(
            _icon,
            size: kSizeSmallBtn,
          ),
        ),
      ),
    );
  }
}