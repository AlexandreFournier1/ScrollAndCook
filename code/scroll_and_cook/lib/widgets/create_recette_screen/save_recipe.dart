import 'package:dto/dto.dart';
import 'package:dto/model/ingredient.dart';
import 'package:dto/model/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/recette_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';

class SaveRecipe extends StatelessWidget {
  const SaveRecipe({
    super.key,
    required String title,
    required int difficulte,
    required String? imagePath,
    required int tempsRecette,
    required int nbPersonne,
    required List<String> etapeList,
    required FirestoreODM<AppSchema> db,
    required Map<String, String> ingredientsList,
    required bool isEditMode,
    String? recipeId,
  }) : _imagePath = imagePath, _title = title, _difficulte = difficulte, _tempsRecette = tempsRecette, _nbPersonne = nbPersonne, _etapeList = etapeList, _db = db, _ingredientsList = ingredientsList, _isEditMode = isEditMode, _recipeId = recipeId;

  final String _title;
  final int _difficulte;
  final String? _imagePath;
  final int _tempsRecette;
  final int _nbPersonne;
  final List<String> _etapeList;
  final FirestoreODM<AppSchema> _db;
  final Map<String, String> _ingredientsList;

  final bool _isEditMode;
  final String? _recipeId;

  @override
  Widget build(BuildContext context) {
    bool isRecipeValid(BuildContext context) {
      if (_title.trim().isEmpty) {
        MyCustomSnackBar(context, "Veuillez renseigner un titre");
        return false;
      }

      if (_tempsRecette <= 0) {
        MyCustomSnackBar(context, "Veuillez indiquer un temps valide");
        return false;
      }

      if (_ingredientsList.isEmpty) {
        MyCustomSnackBar(context, "Veuillez ajouter au moins un ingrédient");
        return false;
      }

      if (_etapeList.isEmpty) {
        MyCustomSnackBar(context, "Veuillez ajouter au moins une étape");
        return false;
      }

      return true;
    }

    return Padding(
      padding: const EdgeInsets.all(kNormalPadding),
      child: Container(
        decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: kMinimalRadius
        ),
        width: kIconSize * 2,
        child: FutureBuilder(
          future: _db.recipes.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Erreur : ${snapshot.error}');
            }

            final allRecipes = snapshot.data ?? [];

            final currentTitle = _title.trim().toLowerCase();

            bool titleAlreadyExist = allRecipes.any((recipe) {
              if (_isEditMode && recipe.id == _recipeId) return false;
              return recipe.titre.trim().toLowerCase() == currentTitle;
            });

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                if (!isRecipeValid(context)) return;
                if (titleAlreadyExist) {
                  MyCustomSnackBar(context, "Le titre $_title existe déjà !");
                  return;
                }
                final userId = FirebaseAuth.instance.currentUser?.uid;
                if (userId == null) {
                  MyCustomSnackBar(context, "Utilisateur non connecté");
                  return;
                }

                String image = _imagePath!;

                if (image.isEmpty) {
                  image = "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/assiette_vide.jpg";
                }

                final recetteId = _isEditMode
                    ? _recipeId!
                    : _title.toLowerCase();

                final recette = Recipe(
                  id: recetteId,
                  titre: _title,
                  difficulty: _difficulte,
                  image: image,
                  temps: _tempsRecette,
                  nbMinPersonne: _nbPersonne,
                  listEtape: _etapeList,
                  isPosted: false,
                  nbLike: -1,
                );

                if (_isEditMode) {
                  await _db.recipes(recetteId).update(recette);
                } else {
                  await _db.recipes.insert(recette);
                }

                if (_isEditMode) {
                  final oldIngredients = await _db.recipes(recetteId).ingredients.get();
                  for (final ing in oldIngredients) {
                    await _db.recipes(recetteId).ingredients(ing.id).delete();
                  }
                }

                for (final entry in _ingredientsList.entries) {
                  final ingredient = Ingredient(
                    id: "${recetteId}_${entry.key.toLowerCase()}",
                    name: entry.key,
                    type: "",
                    quantity: entry.value,
                  );

                  await _db.recipes(recetteId).ingredients.insert(ingredient);
                }

                if (!_isEditMode) {
                  final user = await _db.users(userId).get();
                  if (user != null) {
                    await _db.recipes(recetteId).owners.insert(user);
                  }
                }

                MyCustomSnackBar(
                  context,
                  _isEditMode
                      ? "Recette modifiée avec succès !"
                      : "Recette créée avec succès !",
                );

                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                      RecetteScreen(
                        isPersonalRecette: true,
                        isJustCreated: !_isEditMode,
                        idRecette: recetteId,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(kNormalPadding),
                child: Icon(Icons.save),
              ),
            );
          }
        ),
      ),
    );
  }
}