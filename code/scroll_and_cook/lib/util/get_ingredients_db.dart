import 'package:dto/dto.dart';
import 'package:dto/model/ingredient.dart';

Future<List<String>> getIngredientFromDb(FirestoreODM<AppSchema> db, String Type) async {
  final ingredientsFromDb = await db.ingredients.get();
  List<String> ingredientToReturn = [];
  for (Ingredient ingredient in ingredientsFromDb) {
    if(Type.isEmpty){
      ingredientToReturn.add(ingredient.name);
    } else {
      if(ingredient.type == Type)
        ingredientToReturn.add(ingredient.name);
    }
  }
  return ingredientToReturn;
}