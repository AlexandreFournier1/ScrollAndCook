import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/widgets/builder/recette_text_research.dart';
import 'package:scroll_and_cook/widgets/builder/recipe_ingredient_research.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/custom_title_screen.dart';

class ResultResearchRecipeScreen extends StatefulWidget {
  ResultResearchRecipeScreen({
    super.key,
    String? textResearch,
    List<String>? ingredients,
  }) : _textResearch = textResearch ?? "", _listIngredient= ingredients ?? [];

  static const routeName = '/resultResearchRecipe';

  final String _textResearch;
  final List<String> _listIngredient;

  @override
  State<ResultResearchRecipeScreen> createState() => _ResultResearchRecipeScreenState();
}

class _ResultResearchRecipeScreenState extends State<ResultResearchRecipeScreen> {
  late final TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
        appSchema,
        firestore: FirebaseFirestore.instance
    );

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  WBackButton(),
                  MyTitleScreen(title: 'Resultat Recherche', color: kSecondColor,)
                ],
              ),
              SizedBox(height: kHeightBetweenElement,),

              if (widget._textResearch.isNotEmpty) ...{
                RecetteTextResearch(db: db, text: widget._textResearch,),
              } else if (widget._listIngredient.isNotEmpty) ...{
                RecipeIngredientResearch(db: db, listIngredient: widget._listIngredient,),
              } else ...{
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Aucun critère de recherche fourni",),
                ),
              }

            ],
          ),
        ),
      ),
    );
  }
}
