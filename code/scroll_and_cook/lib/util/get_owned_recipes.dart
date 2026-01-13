import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';

Future<List<Recipe>> getRecipesOwnedByUser(FirestoreODM<AppSchema> db, String userId) async {
  final recipes = await db.recipes.get();

  final ownedRecipes = <Recipe>[];

  for (final recipe in recipes) {
    final owners = await db.recipes(recipe.id).owners.get();
    if (owners.any((user) => user.id == userId)) {
      ownedRecipes.add(recipe);
    }
  }

  return ownedRecipes;
}
