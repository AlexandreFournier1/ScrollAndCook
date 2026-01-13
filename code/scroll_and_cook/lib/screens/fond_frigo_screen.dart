import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/result_research_recipe_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/custom_title_screen.dart';
import 'package:scroll_and_cook/widgets/list_view/ingredient_add.dart';

class FondFrigoScreen extends StatefulWidget {
  const FondFrigoScreen({super.key});


  static const routeName = '/fond_frigo';

  @override
  State<FondFrigoScreen> createState() => _FondFrigoScreenState();
}

class _FondFrigoScreenState extends State<FondFrigoScreen> {
  late final TextEditingController ViandeController;
  late final TextEditingController LegumeController;
  late final TextEditingController PateController;
  late final TextEditingController FruitController;
  late final TextEditingController EpiceController;

  List<String> Viande = <String>[];
  List<String> Legume = <String>[];
  List<String> Pate = <String>[];
  List<String> Fruit = <String>[];
  List<String> Epice = <String>[];

  @override
  void initState() {
    super.initState();
    ViandeController = TextEditingController();
    LegumeController = TextEditingController();
    PateController = TextEditingController();
    FruitController = TextEditingController();
    EpiceController = TextEditingController();
  }

  @override
  void dispose() {
    ViandeController.dispose();
    LegumeController.dispose();
    PateController.dispose();
    FruitController.dispose();
    EpiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    return Scaffold(
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
                      title: "Fond de frigo",
                      color: kSecondColor,
                    ),
                  ],
                ),
                SizedBox(height: kHalfHeightBetweenElement,),
                IngredientAdd(listIgredients: Viande, listController: ViandeController, typeIngredient: 'Viandes', db: db,),
                SizedBox(height: kHalfHeightBetweenElement,),
                IngredientAdd(listIgredients: Legume, listController: LegumeController, typeIngredient: 'Legumineuse', db: db,),
                SizedBox(height: kHalfHeightBetweenElement,),
                IngredientAdd(listIgredients: Pate, listController: PateController, typeIngredient: 'Feculent', db: db,),
                SizedBox(height: kHalfHeightBetweenElement,),
                IngredientAdd(listIgredients: Fruit, listController: FruitController, typeIngredient: 'Fruit', db: db,),
                SizedBox(height: kHalfHeightBetweenElement,),
                IngredientAdd(listIgredients: Epice, listController: EpiceController, typeIngredient: 'Epice', db: db,),
                SizedBox(height: kHalfHeightBetweenElement,),
                CustomButton(
                  onTapFunction: () {
                    List<String> ingredientList = Viande + Legume + Pate + Fruit + Epice;
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) =>
                                ResultResearchRecipeScreen(
                                    ingredients: ingredientList
                                )
                        )
                    );
                  },
                  label: "Rechercher",
                ),
                SizedBox(height: kHalfHeightBetweenElement,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}