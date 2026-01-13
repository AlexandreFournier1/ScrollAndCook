import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/widgets/list_view/item_list_view.dart';

class MyListViewElement extends StatelessWidget {
  const MyListViewElement({
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
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kHorizontalPadding),
      child: Row(
        children: [
          for (final id in _recipeId)
            FutureBuilder(
              future: db.recipes(id).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Erreur 2 : ${snapshot.error}');
                }

                final recipe = snapshot.data!;

                return MyItemListView(
                  title: recipe.titre,
                  count: recipe.difficulty,
                  time: recipe.temps,
                  image: recipe.image,
                  recipeId: recipe.id,
                  isCataloguePerso: _isCataloguePerso,
                  isPersonalRecette: _isPersonalRecette,
                );
              },
            ),
        ],
      ),
    );
  }
}