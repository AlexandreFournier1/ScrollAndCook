import 'package:dto/dto.dart';
import 'package:dto/model/ingredient.dart';

Future<List<String>> getIngredientByRecipe(FirestoreODM<AppSchema> db, String id) async {
  final ingredientsFromDb = await db.recipes(id).ingredients.get();
  List<String> ingredientToReturn = [];
  for (final ingredient in ingredientsFromDb) {
    ingredientToReturn.add(ingredient.name);
  }
  return ingredientToReturn;
}
