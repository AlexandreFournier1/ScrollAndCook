import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';
import 'package:scroll_and_cook/util/get_ingredients_db.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_bottom_icon.dart';
import 'package:scroll_and_cook/widgets/button/custom_button_personne.dart';
import 'package:scroll_and_cook/widgets/button/custom_elevated_button.dart';
import 'package:scroll_and_cook/widgets/create_recette_screen/save_recipe.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/custom_title_screen.dart';
import 'package:scroll_and_cook/widgets/input/custom_combobox.dart';
import 'package:scroll_and_cook/widgets/input/custom_text_input.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:scroll_and_cook/widgets/text_box_rectangular.dart';

class CreateRecetteScreen extends StatefulWidget {
  const CreateRecetteScreen({super.key, bool? isForModification, String? recipeId}) : _isForModification = isForModification, _recipeId = recipeId;

  static const routeName = '/create-recette';

  final bool? _isForModification;
  final String? _recipeId;

  @override
  State<CreateRecetteScreen> createState() => _CreateRecetteScreenState();
}

class _CreateRecetteScreenState extends State<CreateRecetteScreen> {
  final List<String> image = [
    "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/burger.png",
    "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/mitraillette.png",
    "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_recette/tartiflette.png"
  ];

  late final TextEditingController quantityController;
  late final TextEditingController comboBoxController;
  late final TextEditingController tempsController;
  late final TextEditingController etapeController;
  late final TextEditingController titreController;
  late final TextEditingController comboBoxDifficultyController;

  late List<String> quantiteList = [];
  late Map<String, String> ingredientsList = {};
  late List<String> etapeList = [];

  String labelTextIngredient = "Vos ingrédients";
  String selectedIngredient = "";
  int tempsRecette = -1;
  String title = "";
  int difficulte = 1;

  bool _isLoading = false;
  Recipe? _recipe;

  late Future<List<String>> ingredientFromDb;

  @override
  void initState() {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );
    
    super.initState();
    quantityController = TextEditingController();
    comboBoxController = TextEditingController();
    tempsController = TextEditingController();
    etapeController = TextEditingController();
    titreController = TextEditingController();
    comboBoxDifficultyController = TextEditingController();

    if (widget._isForModification == true && widget._recipeId != null) {
      _loadRecipeForEdit();
    }

    ingredientFromDb = getIngredientFromDb(db, "");
  }

  Future<void> _loadRecipeForEdit() async {
    setState(() => _isLoading = true);

    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    final recipe = await db.recipes(widget._recipeId!).get();
    if (recipe == null) {
      setState(() => _isLoading = false);
      return;
    }

    final ingredients = await db.recipes(recipe.id).ingredients.get();

    setState(() {
      _recipe = recipe;

      title = recipe.titre;
      titreController.text = recipe.titre;

      difficulte = recipe.difficulty;
      comboBoxDifficultyController.text = recipe.difficulty.toString();

      if (recipe.temps == -1) {
        tempsRecette = 0;
        tempsController.text = "0";
      } else {
        tempsRecette = recipe.temps;
        tempsController.text = recipe.temps.toString();
      }

      nbPersonne = recipe.nbMinPersonne;

      imageSelected = recipe.image;
      isPictureAdded = recipe.image.isNotEmpty;

      etapeList = List.from(recipe.listEtape);

      ingredientsList = {
        for (final ing in ingredients) ing.name: ing.quantity
      };

      _isLoading = false;
    });
  }

  int nbPersonne = 1;
  bool isPictureAdded = false;
  String imageSelected = "";
  @override
  Widget build(BuildContext context) {
    final bool isEditMode = widget._isForModification == true && widget._recipeId != null;

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    late final ingredientsEntries = ingredientsList.entries.toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kMainBackgroundColor,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      WBackButton(),
                      MyTitleScreen(
                          title: title == ""
                            ? "Création Recette"
                            : title,
                          color: kSecondColor
                      ),
                      MyCustomElevatedButton(
                        color: kSecondColor,
                        size: kIconSize * 3,
                        isIcon: true,
                        icon: Icons.mode,
                        elementBox: [
                          Text("Veuillez entrer le titre",
                              style: kMainTextCreateRecette
                          ),
                          CustomTextInput(
                            controller: titreController,
                            validator: (_) {},
                            label: "Titre",
                            hint: "ex:Burger Maison",
                            isEmail: false,
                          ),
                          MyCustomBottomIcon(
                            validOnTap: () {
                              setState(() {
                                title = titreController.text;
                              });
                              MyCustomSnackBar(context, "Le titre est maintenant : ${titreController.text}");
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      SaveRecipe(
                        title: title,
                        difficulte: difficulte,
                        imagePath: imageSelected,
                        tempsRecette: tempsRecette,
                        nbPersonne: nbPersonne,
                        etapeList: etapeList,
                        db: db,
                        ingredientsList: ingredientsList,
                        isEditMode: widget._isForModification == null ? false : true,
                        recipeId: widget._isForModification == null ? null : widget._recipeId,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kLargePadding),
                        child: isPictureAdded
                            ? GestureDetector(
                          behavior: HitTestBehavior.opaque,
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kWhiteColor,
                                          borderRadius: kNormalRadius
                                      ),
                                      margin: const EdgeInsets.all(kNormalPadding),
                                      width: 300,
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Column(
                                        children: [
                                          Text("Choisissez une image de recette", style: kMainTextRecetteScreen),
                                          SizedBox(
                                            height: 100,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              padding: const EdgeInsets.symmetric(horizontal: kLargePadding),
                                              itemCount: image.length,
                                              itemBuilder: (context, index) {
                                                final img = image[index];

                                                return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        imageSelected = img;
                                                      });
                                                      MyCustomSnackBar(context, "Vous avez sélectionner une image !");
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: kNormalPadding
                                                      ),
                                                      child: CustomImage(
                                                          size: kCreateRecetteImage,
                                                          path: img,
                                                          assetOrNot: false
                                                      ),
                                                    )
                                                );
                                              },
                                            ),
                                          ),
                                          MyCustomBottomIcon(
                                            validOnTap: () async {
                                              if (imageSelected.isEmpty) {
                                                MyCustomSnackBar(context, "Veuillez sélectionner une image");
                                                return;
                                              }
                                              setState(() {
                                                isPictureAdded = true;
                                              });
                                              MyCustomSnackBar(context, "L'image de la recette a été modifiée !");
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kWhiteColor,
                                      width: 5,
                                    ),
                                    borderRadius: kNormalRadius
                                ),
                                height: MediaQuery.of(context).size.width / 2,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(imageSelected),
                              ),
                            )
                            : GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kWhiteColor,
                                          borderRadius: kNormalRadius
                                      ),
                                      margin: const EdgeInsets.all(kNormalPadding),
                                      width: 300,
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Column(
                                        children: [
                                          Text("Choisissez une image de recette", style: kMainTextRecetteScreen),
                                          SizedBox(
                                            height: 100,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              padding: const EdgeInsets.symmetric(horizontal: kLargePadding),
                                              itemCount: image.length,
                                              itemBuilder: (context, index) {
                                                final img = image[index];

                                                return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        imageSelected = img;
                                                      });
                                                      MyCustomSnackBar(context, "Vous avez sélectionner une image !");
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: kNormalPadding
                                                      ),
                                                      child: CustomImage(
                                                          size: kCreateRecetteImage,
                                                          path: img,
                                                          assetOrNot: false
                                                      ),
                                                    )
                                                );
                                              },
                                            ),
                                          ),
                                          MyCustomBottomIcon(
                                            validOnTap: () async {
                                              if (imageSelected.isEmpty) {
                                                MyCustomSnackBar(context, "Veuillez sélectionner une image");
                                                return;
                                              }
                                              setState(() {
                                                isPictureAdded = true;
                                              });
                                              MyCustomSnackBar(context, "L'image de la recette a été changée !");
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                              child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kWhiteColor,
                                    width: 5,
                                  ),
                                  borderRadius: kNormalRadius
                              ),
                              height: MediaQuery.of(context).size.width / 2,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Icon(Icons.mode)
                              ),
                            ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(kNormalPadding),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: kMinimalRadius,
                                    color: kWhiteColor
                                ),
                                width: kBoxNbPerson,
                                child: Padding(
                                  padding: const EdgeInsets.all(kNormalPadding),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Icon(
                                            Icons.perm_identity,
                                            size: kIconSize,
                                          )),
                                      Expanded(
                                        child: Text(
                                            nbPersonne.toString(),
                                            style: kMainTextCreateRecette
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            MyCustomButtonNbPersonne(
                              icon: Icons.add,
                              onTapFunction: () {
                                setState(() {
                                  nbPersonne++;
                                });
                                MyCustomSnackBar(context, "Vous avez ajouté une personne !");
                              },
                            ),
                            MyCustomButtonNbPersonne(
                              icon: Icons.remove,
                              onTapFunction: () {
                                if (nbPersonne > 1) {
                                  setState(() {
                                    nbPersonne--;
                                  });
                                  MyCustomSnackBar(context, "Vous avez retiré une personne !");
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: kLargePadding,
                      bottom: kNormalPadding
                    ),
                    child: RectangularTextBox(
                      color: kSecondColor,
                      title: "Liste Ingrédients",
                      align: Alignment.centerLeft,
                      leftpad: kLargePadding,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kNormalPadding),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: FutureBuilder(
                            future: ingredientFromDb,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              if (snapshot.hasError) {
                                return Text('Erreur 1 : ${snapshot.error}');
                              }

                              final ingredients = snapshot.data ?? [];

                              return TypeAheadField<String>(
                                suggestionsCallback: (pattern) async {
                                  return ingredients
                                      .where((item) => item
                                      .toLowerCase()
                                      .contains(pattern.toLowerCase()))
                                      .toList();
                                },
                                builder: (context, controller, focusNode) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius: kNormalRadius
                                    ),
                                    child: TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: kNormalRadius
                                        ),
                                        labelText: labelTextIngredient,
                                      ),
                                    ),
                                  );
                                },
                                itemBuilder: (context, ingredient) {
                                  return ListTile(
                                    title: Text(ingredient),
                                  );
                                },
                                onSelected: (suggestion) {
                                  setState(() {
                                    selectedIngredient = suggestion;
                                    labelTextIngredient = suggestion;
                                  });
                                  MyCustomSnackBar(context, "Vous avez sélectionné $suggestion");
                                },
                                hideOnLoading: true,
                                hideOnError: true,
                                hideOnEmpty: true,
                              );
                            }
                          ),
                        ),
                      ),
                      MyCustomElevatedButton(
                        color: kWhiteColor,
                        isIcon: false,
                        title: "g / mL",
                        elementBox: [
                          Text("Veuillez entrer la quantité",
                              style: kMainTextCreateRecette
                          ),
                          CustomTextInput(
                            controller: quantityController,
                            validator: (_) {},
                            label: "Quantité",
                            hint: "ex:50",
                            isEmail: false,
                          ),
                          CustomCombobox(
                              controller: comboBoxController,
                              validator: (_) {},
                              label: "Unité",
                              hint: "",
                              comboItems: ["grammes", "millilitres"]
                          ),
                          MyCustomBottomIcon(
                            validOnTap: () {
                              String unite = comboBoxController.text == "millilitres" ? "ml" : "gr";
                              String qty = "${quantityController.text} $unite";
                              quantiteList.add(qty);
                              MyCustomSnackBar(context, "Vous avez ajouté la quantité : $qty");
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (selectedIngredient.isEmpty || quantiteList.isEmpty) {
                            MyCustomSnackBar(context, "Veuillez choisir un ingrédient et une quantité");
                          }
                          else {
                            ingredientsList[selectedIngredient] = quantiteList.last;
                          }
                          MyCustomSnackBar(context, "Vous avez ajouter un ingrédient !");
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kSecondColor,
                              borderRadius: kMinimalRadius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(kNormalPadding),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kLargePadding,
                        vertical: kSmallPadding
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: kMiniRadius,
                        ),
                        child: ingredientsList.isNotEmpty
                        ? ListView.builder(
                          itemCount: ingredientsList.length,
                          itemBuilder: (context, index) {
                            final entry = ingredientsEntries[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kNormalPadding,
                                  vertical: kSmallPadding
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${entry.key}  ${entry.value}",
                                    style: kTextListView,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        ingredientsList.remove(entry.key);
                                      });
                                      MyCustomSnackBar(context, "Vous avez retirer un ingrédient !");
                                    },
                                    child: Icon(Icons.remove),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                            : Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Pas d'ingrédients pour le moment",
                                  style: kTextVideCreateRecette,
                                )
                            )
                        )
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: kLargePadding,
                          bottom: kNormalPadding,
                        ),
                        child: RectangularTextBox(
                          color: kSecondColor,
                          title: "Recette",
                          align: Alignment.centerLeft,
                          leftpad: kLargePadding,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kBigPadding
                        ),
                        child: MyCustomElevatedButton(
                          color: kSecondColor,
                          isIcon: true,
                          size: kIconSize * 3,
                          icon: Icons.add,
                          elementBox: [
                            Text("Veuillez entrer les étapes de la recette",
                                style: kMainTextCreateRecette
                            ),
                            CustomTextInput(
                              controller: etapeController,
                              validator: (String? value) {},
                              label: "Texte étape",
                              hint: "ex:Couper les tomates",
                              isEmail: false,
                            ),
                            MyCustomBottomIcon(
                              validOnTap: () {
                                setState(() {
                                  etapeList.add(etapeController.text);
                                });
                                Navigator.pop(context);
                                MyCustomSnackBar(context, "Vous avez ajouté une étape à la recette !");
                              },
                            )
                          ],
                        ),
                      ),
                      MyCustomElevatedButton(
                        color: kWhiteColor,
                        isIcon: false,
                        size: kTimeButton,
                        title: "min",
                        elementBox: [
                          Text("Veuillez indiquer le temps de la recette",
                              style: kMainTextCreateRecette
                          ),
                          CustomTextInput(
                            controller: tempsController,
                            validator: (_) {},
                            label: "Temps (min)",
                            hint: "ex:30",
                            isEmail: false,
                          ),
                          MyCustomBottomIcon(
                            validOnTap: () {
                              final int? temps = int.tryParse(tempsController.text);

                              if (temps == null || temps <= 0) {
                                MyCustomSnackBar(
                                  context,
                                  "Vous devez renseigner un temps valide (nombre entier positif)",
                                );
                                return;
                              }

                              tempsRecette = int.parse(tempsController.text);

                              MyCustomSnackBar(context, "La recette prendra $temps min à être réalisée");
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kLargePadding,
                        vertical: kSmallPadding
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: kMiniRadius,
                        ),
                        child: etapeList.isNotEmpty
                         ? ListView.builder(
                          itemCount: etapeList.length,
                          itemBuilder: (context, index) {
                            final entry = etapeList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kNormalPadding,
                                  vertical: kSmallPadding
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        "${index + 1}) $entry",
                                        style: kTextListView,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        etapeList.remove(entry);
                                      });
                                      MyCustomSnackBar(context, "Vous avez retiré une étape de la recette");
                                    },
                                    child: Icon(Icons.remove),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                            : Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Pas d'étapes pour le moment",
                                style: kTextVideCreateRecette,
                              )
                            )
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kNormalPadding),
                    child: MyCustomElevatedButton(
                      color: kSecondColor,
                      size: kSizeDifficulte,
                      isIcon: false,
                      title: "Difficulté",
                      elementBox: [
                        Text("Choisissez la difficulté de la recette",
                            style: kMainTextCreateRecette
                        ),
                        CustomCombobox(
                          controller: comboBoxDifficultyController,
                          validator: (_) {},
                          label: "Difficulté",
                          hint: "",
                          comboItems: [
                            "1 : Très facile",
                            "2 : Facile",
                            "3 : Moyen",
                            "4 : Difficile",
                            "5 : Très difficile"
                          ]
                        ),
                        MyCustomBottomIcon(
                          validOnTap: () {
                            if (comboBoxDifficultyController.text.contains("1")) {
                              difficulte = 1;
                            } else if (comboBoxDifficultyController.text.contains("2")) {
                              difficulte = 2;
                            } else if (comboBoxDifficultyController.text.contains("3")) {
                              difficulte = 3;
                            } else if (comboBoxDifficultyController.text.contains("4")) {
                              difficulte = 4;
                            } else if (comboBoxDifficultyController.text.contains("5")) {
                              difficulte = 5;
                            }

                            MyCustomSnackBar(context, "Vous avez choisi la difficulté ${comboBoxDifficultyController.text}");
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}