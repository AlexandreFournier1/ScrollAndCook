import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/ingredient_item_list_view.dart';

class IngredientListViewElement extends StatelessWidget {
  const IngredientListViewElement({
    super.key,
    required List<String> list_ingredient,
    required List<String> list_grammage,
  }) : _ingredient = list_ingredient, _grammage = list_grammage;

  final List<String> _ingredient;
  final List<String> _grammage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < _ingredient.length; i++)
            IngredientListView(ingredient: _ingredient[i], grammage: _grammage[i],),
        ],
      ),
    );
  }
}
