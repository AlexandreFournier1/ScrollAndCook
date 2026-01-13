import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class MyCustomElevatedButton extends StatelessWidget {
  const MyCustomElevatedButton({
    super.key,
    String? title,
    required List<Widget> elementBox,
    IconData? icon,
    required bool isIcon,
    double? size = 104,
    required Color color,
  }) : _title = title, _elementBox = elementBox, _icon = icon, _isIcon = isIcon, _size = size, _color = color;

  final IconData? _icon;
  final String? _title;
  final bool _isIcon;
  final List<Widget> _elementBox;
  final double? _size;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kNormalPadding),
      child: Container(
        height: kSizeNormalBtn,
        width: _size,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(_color)
          ),
          child: _isIcon
            ? Icon(_icon, size: kIconSize, color: kBlackColor,)
            : Text(_title!, style: kMainTextCreateRecette),
          onPressed: () async => showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: kNormalRadius
                ),
                margin: const EdgeInsets.all(kNormalPadding),
                width: kWidthElevatedButton,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _elementBox,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}