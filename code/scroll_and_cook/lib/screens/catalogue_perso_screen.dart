import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/create_recette_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/util/get_owned_recipes.dart';
import 'package:scroll_and_cook/widgets/builder/recipe_list_view.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/floating_navbar_positioned.dart';
import 'package:scroll_and_cook/widgets/text_box_rectangular.dart';

class CataloguePersoScreen extends StatefulWidget {
  const CataloguePersoScreen({super.key});

  static const routeName = '/catalogue-perso';

  @override
  State<CataloguePersoScreen> createState() => _CataloguePersoScreenState();
}

class _CataloguePersoScreenState extends State<CataloguePersoScreen> {
  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Text("Aucun utilisateur connecté");
    }

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: kBigPadding
                      ),
                      child: CustomImage(
                        size: kLogoSize,
                        path: 'assets/icons/logo.png',
                        assetOrNot: true,
                      ),
                    ),
                    SizedBox(height: kHalfHeightBetweenElement,),
                    RectangularTextBox(title: "Recettes Enregistrée", color: kWhiteColor, align: Alignment.centerLeft, leftpad: kHorizontalPadding,),
                    SizedBox(height: kHalfHeightBetweenElement,),

                    RecipeListViewFuturBuilder(future: db.users(userId).savedRecipes.get(), isPersonalRecette: false,),

                    SizedBox(height: kHalfHeightBetweenElement + 10,),
                    RectangularTextBox(title: "Mes Recettes", color: kWhiteColor, align: Alignment.centerLeft, leftpad: kHorizontalPadding,),
                    SizedBox(height: kHalfHeightBetweenElement,),

                    FutureBuilder(
                      future: getRecipesOwnedByUser(db, userId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }

                        return RecipeListViewFuturBuilder(
                          future: Future.value(snapshot.data!), isPersonalRecette: true,
                        );
                      },
                    ),

                    SizedBox(height: kHeightBetweenElement,),
                    CustomButton(onTapFunction: () {Navigator.pushNamed(context, CreateRecetteScreen.routeName);}, label: "Créer une recette"),
                    SizedBox(height: kHeightBetweenElement*3,),
                  ],
                ),
              ),
            ),
          ),
          FloatingNavbarWithPosition(
            whatPage: 2,
            idUtilisateur: userId,
          )
        ]
      ),
    );
  }
}


