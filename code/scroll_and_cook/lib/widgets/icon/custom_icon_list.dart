import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/icon/custom_icon.dart';

class MyIconList extends StatelessWidget {
  const MyIconList({
    super.key, required List<IconData> list, required double size, required List<Function()> onTap,
  }) : _list = list, _size = size, _onTap = onTap;

  final List<IconData> _list;
  final double _size;
  final List<Function()> _onTap;

  @override
  Widget build(BuildContext context) {
    late final Map<String, String> test;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < _list.length; i++)
            MyCustomIcon(
              icon: _list.elementAt(i),
              onTap: _onTap.elementAt(i),
              size: _size,
            )
        ]
      ),
    );
  }
}