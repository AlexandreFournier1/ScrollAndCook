import 'package:dto/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/list_view/list_view.dart';

class RecipeListViewFuturBuilder extends StatelessWidget {
  const RecipeListViewFuturBuilder({
    super.key,
    required Future<List<Recipe>> future,
    required bool isPersonalRecette,
  }) : _future = future, _isPersonalRecette = isPersonalRecette;

  final Future<List<Recipe>> _future;
  final bool _isPersonalRecette;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text('Erreur 2 : ${snapshot.error}');
          }

          final recipes = snapshot.data ?? [];

          if (recipes.isEmpty) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: ColoredBox(
                color: kSecondColor,
                child: Padding(
                  padding: const EdgeInsets.all(kBigPadding),
                  child: Center(child: Text("Vous n'avez pas encore de recettes dans cette catégorie !", style: kTextVide)),
                ),
              ),
            );
          }

          return MyListView(
            recipeId: recipes.map((elem) => elem.id).toList(),
            isCataloguePerso: true,
            isPersonalRecette: _isPersonalRecette,
          );
        }
    );
  }
}