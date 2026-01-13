import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/widgets/list_view/list_view_element.dart';


class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
    required List<String> recipeId,
    required bool isCataloguePerso,
    required bool isPersonalRecette,
  })  : _recipeId = recipeId,
        _isCataloguePerso = isCataloguePerso, _isPersonalRecette = isPersonalRecette;

  final List<String> _recipeId;
  final bool _isCataloguePerso;
  final bool _isPersonalRecette;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ColoredBox(
        color: kSecondColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            MyListViewElement(
              recipeId: _recipeId,
              isCataloguePerso: _isCataloguePerso,
              isPersonalRecette: _isPersonalRecette,
            ),
          ],
        ),
      ),
    );
  }
}
