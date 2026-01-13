import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/util/get_ingredient_by_recipe.dart';
import 'package:scroll_and_cook/widgets/list_view/recette_list_view_element.dart';

class RecipeIngredientResearch extends StatelessWidget {
  const RecipeIngredientResearch({
    super.key,
    required FirestoreODM<AppSchema> db,
    required List<String> listIngredient
  }): _db = db, _listIngredient = listIngredient;


  final FirestoreODM<AppSchema> _db;
  final List<String> _listIngredient;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _db.recipes.get(),
        builder: (context, snapshot)  {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Error : ${snapshot.error}");
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return Text("Aucune Recette Trouver");
          }

          return FutureBuilder(
              future: buildRecipeResult(_db, data, _listIngredient),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text("Error : ${snapshot.error}");
                }

                final result = snapshot.data ?? [];

                if (result.isEmpty) {
                  return Text("Aucune Recette Trouver");
                }

                return RecetteListViewElement(
                  id: result.map((res) => res['id'] as String).toList(),
                  title: result.map((res) => res['title'] as String).toList(),
                  path: result.map((res) => res['image'] as String).toList(),
                  starCount: result.map((res) => res['difficulty'] as int).toList(),
                  db: _db,
                );
              }
          );

        }
    );
  }
}

Future<List<Map<String, dynamic>>> buildRecipeResult(
    FirestoreODM<AppSchema> db,
    List<Recipe> recettes,
    List<String> listIngredient,
    ) async {
  final List<Map<String, dynamic>> result = [];
  int count;

  for (final recipe in recettes) {
    final List<String> ingredients = await getIngredientByRecipe(db, recipe.id);
    count = 0;
    for (final ing in ingredients) {
      if (listIngredient.contains(ing)) {
        count++;
      }
    }

    if (count > 0) {
      result.add({
        'id': recipe.id,
        'title': recipe.titre,
        'image': recipe.image,
        'difficulty': recipe.difficulty,
        'count': count,
      });
    }
  }

  result.sort((a, b) => (b['count'] as int).compareTo(a['count'] as int),);

  return result;
}
