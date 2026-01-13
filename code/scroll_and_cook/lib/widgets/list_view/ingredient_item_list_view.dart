import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/padding.dart';

class IngredientListView extends StatelessWidget {
  const IngredientListView({
    super.key,
    required String ingredient,
    required String grammage,
  }): _ingredient = ingredient, _grammage = grammage;

  final String _ingredient;
  final String _grammage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kSmallPadding, top: kSmallPadding, right: kSmallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _ingredient,
              maxLines: kMaxLinesIngredient,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              _grammage,
              textAlign: TextAlign.right,
              maxLines: kMaxLinesIngredient,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
