import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/recette_list_view_element.dart';

class RecetteTextResearch extends StatelessWidget {
  const RecetteTextResearch({
    super.key,
    required FirestoreODM<AppSchema> db,
    required String text
  }): _db = db, _text = text;

  final FirestoreODM<AppSchema> _db;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _db.recipes.stream,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        if(snapshot.hasError) {
          return Text("Error : ${snapshot.error}");
        }

        final recipes = snapshot.data ?? [];

        final filteredRecipes = recipes?.where((recipe) {
          return recipe.titre.toLowerCase().contains(_text.toLowerCase());
        }).toList();

        if (filteredRecipes!.isEmpty) {
          return Text("Aucune recette n'existe");
        }

        return RecetteListViewElement(
          id: filteredRecipes.map((r) => r.id).toList(),
          title: filteredRecipes.map((r) => r.titre).toList(),
          path: filteredRecipes.map((r) => r.image).toList(),
          starCount: filteredRecipes.map((r) => r.difficulty).toList(),
          db: _db,
        );

      },
    )
    ;
  }
}
