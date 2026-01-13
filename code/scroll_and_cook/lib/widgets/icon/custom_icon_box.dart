import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/widgets/icon/custom_icon_list.dart';

class MyIconBox extends StatelessWidget {
  const MyIconBox({
    super.key, required List<IconData> list, required double size, required List<Function()> onTap,
  }) : _list = list, _size = size, _onTap = onTap;

  final List<IconData> _list;
  final List<Function()> _onTap;
  final double _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kSecondColor,
          borderRadius: kMinimalRadius
      ),
      width: _list.length != 1
          ? kIconBoxReferenceSize * _list.length - kIconBoxReferenceSize / _list.length / 2.5
          : kIconBoxReferenceSize,
      child: Padding(
          padding: const EdgeInsets.all(kNormalPadding),
          child: MyIconList(
            onTap: _onTap,
            list: _list,
            size: _size,
          )
      ),
    );
  }
}