import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    @DocumentIdField() required String id,
    required String titre,
    required int difficulty,
    required String image,
    required int temps,
    required int nbMinPersonne,
    required List<String> listEtape,
    required bool isPosted,
    required int nbLike,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
