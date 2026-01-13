import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class MyIngredientLine extends StatelessWidget {
  const MyIngredientLine({
    super.key, required String ingredient, required int quantite, required String unite,
  }) : _ingredient = ingredient, _quantite = quantite, _unite = unite;

  final String _ingredient;
  final int _quantite;
  final String _unite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kLargePadding,
          vertical: kNormalPadding
      ),
      child: Row(
        children: [
          Text(
            "$_quantite $_unite",
            style: kSecondTextRecetteScreen,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kNormalPadding
            ),
            child: Icon(
              Icons.remove,
              size: kIconSize - 10,
            ),
          ),
          Text(
            _ingredient,
            style: kSecondTextRecetteScreen,
          ),
        ],
      ),
    );
  }
}