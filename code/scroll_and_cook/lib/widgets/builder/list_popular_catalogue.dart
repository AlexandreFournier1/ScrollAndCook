import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/list_view.dart';

class ListPopularCatalogue extends StatelessWidget {
  const ListPopularCatalogue({
    super.key,
    required isPopular
  }): _isPopular = isPopular;

  final bool _isPopular;

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    return FutureBuilder(
        future: db.recipes.get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          if(snapshot.hasError){
            return Text("Error : ${snapshot.error}");
          }

          final recipe = snapshot.data ?? [];

          if(recipe.isEmpty){
            return Text("Aucune recette poster soyer le premier a en poster une");
          }

          final List<Recipe> isPosted = recipe.where((recipe) => recipe.isPosted).toList();

          if(isPosted.isEmpty){
            return Text("Aucune recette poster soyer le premier a en poster une");
          }
          if(_isPopular){
            isPosted.sort((a,b) => b.nbLike.compareTo(a.nbLike));
          }else if(!_isPopular){
            isPosted.shuffle();
          }

          final List<Recipe> mostLiked = isPosted.take(10).toList();

          return MyListView(
            recipeId: mostLiked.map((recipe) => recipe.id).toList(),
            isCataloguePerso: false,
            isPersonalRecette: false
          );

        }
    );
  }
}
