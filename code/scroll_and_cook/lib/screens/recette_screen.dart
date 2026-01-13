import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/catalogue_perso_screen.dart';
import 'package:scroll_and_cook/screens/create_recette_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_bottom_icon.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/custom_title_screen.dart';
import 'package:scroll_and_cook/widgets/icon/custom_icon_box.dart';
import 'package:scroll_and_cook/widgets/ingredient_line.dart';
import 'package:scroll_and_cook/widgets/recette_line.dart';

class RecetteScreen extends StatefulWidget {
  const RecetteScreen({
    super.key,
    required bool isPersonalRecette,
    required bool isJustCreated,
    required String idRecette
  }) :_isPersonalRecette = isPersonalRecette, _isJustCreated = isJustCreated, _idRecette = idRecette;

  static const routeName = '/recette';
  final bool _isPersonalRecette;
  final bool _isJustCreated;
  final String _idRecette;

  @override
  State<RecetteScreen> createState() => _RecetteScreenState();
}

class _RecetteScreenState extends State<RecetteScreen> {
  @override
  Widget build(BuildContext context) {
    late final List<MyIngredientLine> ingredientsList = [];
    late final List<MyRecetteLine> recetteEtapeList = [];

    int nbEtape = 1;

    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );


    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: db.recipes(widget._idRecette).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Erreur : ${snapshot.error}');
                  }

                  final recipe = snapshot.data;

                  if (recipe == null) {
                    return Text(
                        "Une erreur est survenue lors du chargement de la recette");
                  }

                  for (var element in recipe.listEtape) {
                    recetteEtapeList.add(
                        MyRecetteLine(
                            number: nbEtape,
                            text: element
                        )
                    );
                    nbEtape++;
                  }

                  return Column(
                    children: [
                      Row(
                        children: [
                          if(userId != null) ... {
                            WBackButton(
                              cataloguePersoRedirection: true,
                            ),
                          } else ...{
                            WBackButton(
                              cataloguePersoRedirection: false,
                            ),
                          },

                          MyTitleScreen(
                            title: recipe.titre,
                            color: kSecondColor,
                          ),
                          if (userId != null) ...{
                            Padding(
                                padding: const EdgeInsets.all(kSmallPadding),
                                child: widget._isPersonalRecette
                                    ? MyIconBox(
                                    list: [
                                      Icons.edit,
                                      Icons.restore_from_trash,
                                    ],
                                    size: kIconSize,
                                    onTap: [
                                          () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                                builder: (context) =>
                                                    CreateRecetteScreen(
                                                      isForModification: true,
                                                      recipeId: recipe.id,
                                                    )
                                            )
                                        );
                                      },
                                        () async =>
                                        showDialog(
                                          context: context,
                                          builder: (
                                            BuildContext context) =>
                                            Dialog(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: kWhiteColor,
                                                    borderRadius: kNormalRadius
                                                ),
                                                margin: const EdgeInsets.all(kNormalPadding),
                                                width: kSizeDeleteDialog,
                                                height: kSizeDisconnectDialog,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Voulez vous vraiment supprimer la recette ${recipe.titre} ?",
                                                      style: kMainTextRecetteScreen),
                                                    MyCustomBottomIcon(
                                                      validOnTap: () async {
                                                        await db.recipes(widget._idRecette).delete();
                                                        MyCustomSnackBar(context, "La recette à été supprimée avec succès !");
                                                        Navigator.pushNamed(context, CataloguePersoScreen.routeName);
                                                      },
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                        )
                                    ]
                                )
                                    : FutureBuilder(
                                    future: db.users(userId).savedRecipes.get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }

                                      if (snapshot.hasError) {
                                        return Text("Erreur : ${snapshot.error}");
                                      }

                                      final recipes = snapshot.data ?? [];
                                      bool hasRecipeSaved = false;

                                      for (Recipe r in recipes) {
                                        if (r.id == widget._idRecette) {
                                          hasRecipeSaved = true;
                                        }
                                      }

                                      return MyIconBox(
                                          list: [
                                            hasRecipeSaved ? Icons.bookmark_added : Icons.bookmark_add_outlined
                                          ],
                                          size: kIconSize,
                                          onTap: [
                                                () async {
                                              if (hasRecipeSaved) {
                                                await db.users(userId).savedRecipes(widget._idRecette).delete();
                                                setState(() {
                                                  hasRecipeSaved = false;
                                                });
                                                MyCustomSnackBar(context, "Vous avez retiré la recette de vos enregistrement");
                                              }
                                              else {
                                                await db.users(userId).savedRecipes.insert(recipe);
                                                setState(() {
                                                  hasRecipeSaved = true;
                                                });
                                                MyCustomSnackBar(context, "Vous avez enregistré la recette ");
                                              }
                                            }
                                          ]
                                      );
                                    }
                                )
                            ),
                          }
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kLargePadding),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(recipe.image)
                                  ),
                                  border: Border.all(
                                    color: kWhiteColor,
                                    width: kBorderSizeImage,
                                  ),
                                  borderRadius: kNormalRadius
                              ),
                              height: MediaQuery.of(context).size.width / 2,
                              width: MediaQuery.of(context).size.width / 2,
                            ),
                          ),
                          if(userId != null)... {
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(
                                          kNormalPadding),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: kMinimalRadius,
                                            color: kWhiteColor
                                        ),
                                        width: kBoxNbPerson,
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              kNormalPadding),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Icon(
                                                    Icons.perm_identity,
                                                    size: kIconSize,
                                                  )
                                              ),
                                              Expanded(
                                                child: Text(
                                                    recipe.nbMinPersonne.toString(),
                                                    style: kMainTextRecetteScreen
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.width / 6),
                                    widget._isPersonalRecette == true
                                        ? FutureBuilder(
                                        future: db.recipes(widget._idRecette).get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }

                                          if (snapshot.hasError) {
                                            return Text(
                                                "Erreur : ${snapshot.error}");
                                          }

                                          final recipe = snapshot.data;

                                          return FutureBuilder(
                                              future: db.users(userId).get(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return const Center(
                                                    child: CircularProgressIndicator(),
                                                  );
                                                }

                                                if (snapshot.hasError) {
                                                  return Text(
                                                      "Erreur : ${snapshot.error}");
                                                }

                                                final user = snapshot.data;

                                                return CustomButton(
                                                    onTapFunction: () async {
                                                      if (recipe!.isPosted == true) {
                                                        MyCustomSnackBar(context, "La recette est déjà postée !");
                                                      }
                                                      else {
                                                        final recipeRef = db.recipes(widget._idRecette);

                                                        await recipeRef.update(recipe.copyWith(
                                                            isPosted: true),
                                                        );

                                                        final userRef = db.users(userId);

                                                        await userRef.update(user!.copyWith(nbPublications: user.nbPublications + 1)
                                                        );

                                                        MyCustomSnackBar(context, "Vous avez posté la recette ${recipe.titre} !");
                                                        setState(() {});
                                                      }
                                                    },
                                                    label: "Poster"
                                                );
                                              }
                                          );
                                        }
                                    )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            )
                          }
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kLargePadding),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: kMinimalRadius,
                                  color: kWhiteColor
                              ),
                              width: MediaQuery.of(context).size.width / 3,
                              child: Padding(
                                padding: const EdgeInsets.all(kNormalPadding),
                                child: Center(
                                  child: Text(
                                    "Ingrédients",
                                    style: kMainTextRecetteScreen,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(kLargePadding),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: kMinimalRadius,
                                  color: kWhiteColor
                              ),
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: Padding(
                                padding: const EdgeInsets.all(kNormalPadding),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: kIconSize - 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: kNormalPadding
                                      ),
                                      child: Text(
                                        recipe.temps.toString(),
                                        style: kSecondTextRecetteScreen,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: kNormalPadding
                                      ),
                                      child: Text(
                                        " min",
                                        style: kSecondTextRecetteScreen,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kLargePadding,
                            vertical: kNormalPadding
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: kMinimalRadius,
                              color: kWhiteColor
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(kNormalPadding),
                            child: SizedBox(
                              height: kHeightIngredientBoxRecette,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: FutureBuilder(
                                    future: db.recipes(widget._idRecette).ingredients.get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      }

                                      if (snapshot.hasError) {
                                        return Text(
                                            'Erreur : ${snapshot.error}');
                                      }

                                      final ingredients = snapshot.data ?? [];

                                      for (var elem in ingredients) {
                                        final parts = elem.quantity.split(' ');
                                        final quantity = int.parse(parts[0]);
                                        final unit = parts[1];

                                        ingredientsList.add(
                                            MyIngredientLine(
                                              quantite: quantity,
                                              unite: unit,
                                              ingredient: elem.name,
                                            )
                                        );
                                      }

                                      return Column(
                                          children: ingredientsList
                                      );
                                    }
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kLargePadding),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: kBlackColor,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(kLargePadding),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: kMinimalRadius,
                                color: kWhiteColor
                            ),
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  kNormalPadding),
                              child: Center(
                                child: Text(
                                  "Recette",
                                  style: kMainTextRecetteScreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kLargePadding,
                            vertical: kNormalPadding
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: kMinimalRadius,
                              color: kWhiteColor
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(kNormalPadding),
                            child: SizedBox(
                              height: kHeightEtapeBoxRecette,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: recetteEtapeList
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}