import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/radius.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required double size,
    required String path,
    required bool assetOrNot
  }) : _size = size, _path = path, _assetOrNot = assetOrNot;

  final double _size;
  final String _path;
  final bool _assetOrNot;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:_assetOrNot? AssetImage(_path) : NetworkImage(_path),
          ),
          borderRadius: kCircleRadius,
        ),
        width: _size,
        height: _size,
      ),
    );
  }
}
