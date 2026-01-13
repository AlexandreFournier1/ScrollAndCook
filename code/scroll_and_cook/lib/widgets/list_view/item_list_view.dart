import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/recette_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/star_count.dart';

class MyItemListView extends StatelessWidget {
  const MyItemListView({
    super.key,
    required String title,
    required int count,
    required int time,
    required String image,
    required String recipeId,
    required bool isCataloguePerso,
    required bool isPersonalRecette
  }) : _title = title, _count = count, _time = time, _image = image, _recipeId = recipeId, _isCataloguePerso = isCataloguePerso, _isPersonalRecette = isPersonalRecette;

  final String _title;
  final int _count;
  final int _time;
  final String _image;
  final String _recipeId;
  final bool _isCataloguePerso;
  final bool _isPersonalRecette;

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) =>
              FutureBuilder(
                future: db.recipes(_recipeId).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Erreur 2 : ${snapshot.error}');
                  }

                  final recipe = snapshot.data;

                  return FutureBuilder(
                    future: db.recipes(_recipeId).ingredients.get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Text('Erreur 2 : ${snapshot.error}');
                      }

                      final ingredients = snapshot.data ?? [];
                      return RecetteScreen(
                          isPersonalRecette: _isPersonalRecette,
                          isJustCreated: false,
                        idRecette: _recipeId,
                      );
                    }
                  );
                }
              )
          )
        );
      },
      child: Padding(
        padding: EdgeInsets.all(kHorizontalPadding),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: kBlackColor,
              width: 2,
            ),
            borderRadius: kMinimalRadius
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: kMinimalRadius,
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                      color: kShadowColor,
                      blurRadius: kBlurRadius,
                      offset: Offset(1, 2)
                  )
                ]
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: kMinimalRadius,
                    image: DecorationImage(
                      image: _image.isEmpty
                          ? NetworkImage("https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/assiette_vide.jpg")
                          : NetworkImage(_image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _title,
                        style: kTextListView,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          Text("Difficulté :"),
                          StarCount(count: _count,),
                        ],
                      ),
                      Text("Temps : $_time min"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}