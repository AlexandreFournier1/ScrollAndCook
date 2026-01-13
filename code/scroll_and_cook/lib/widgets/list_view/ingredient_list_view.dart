import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/widgets/list_view/ingredient_list_view_element.dart';

class IngredientListView extends StatelessWidget {
  const IngredientListView({
    super.key,
    required List<String> list_ingredient,
    required List<String> list_grammage,
  }) : _ingredient = list_ingredient, _grammage = list_grammage;

  final List<String> _ingredient;
  final List<String> _grammage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: kHeightIngredientListView,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          IngredientListViewElement(list_ingredient: _ingredient, list_grammage: _grammage,),
        ],
      ),
    );
  }
}
