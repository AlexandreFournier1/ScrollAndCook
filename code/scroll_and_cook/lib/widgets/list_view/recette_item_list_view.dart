import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/recette_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/star_count.dart';

import 'ingredient_list_view.dart';

class RecetteItemListView extends StatelessWidget {
  const RecetteItemListView({
    super.key,
    required String id,
    required String title,
    required String path,
    required int starCount,
    required FirestoreODM<AppSchema> db,
  }) : _title = title, _path = path, _starCount = starCount, _id = id, _db = db;

  final FirestoreODM<AppSchema> _db;
  final String _id;
  final String _title;
  final String _path;
  final int _starCount;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _db.recipes(_id).ingredients.get(),
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        if(snapshot.hasError){
          return Text("Error : ${snapshot.error}");
        }

        final ingredients = snapshot.data ?? [];
        if(ingredients.isEmpty){
          return Text("Aucun ingrédient trouvé");
        }
        List<String> listIngredient = [];
        List<String> listGrammage = [];

        for(final ing in ingredients){
          listIngredient.add(ing.name);
          listGrammage.add(ing.quantity);
        }

        return Padding(
          padding: EdgeInsets.all(kNormalPadding),
          child: Container(
            height: kHeightRecetteItemListView,
            width: MediaQuery.of(context).size.width*0.90,
            decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: kMinimalRadius,
              border: Border.all(
                  color: kWhiteColor,
                  width: 4
              ),
            ),
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                      RecetteScreen(
                        isPersonalRecette: false,
                        isJustCreated: false,
                        idRecette: _id,
                      ),
                  )
                );
              },
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: kMinimalRadius,
                        image: DecorationImage(image: NetworkImage(_path))
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          _title,
                          style: kTextTextInput,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text("Difficulty : "),
                        StarCount(count: _starCount,),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(kVerySmallPadding),
                            child: Container(
                              height: kSizeContainerIngredientListView,
                              child: Column(
                                children: [
                                  IngredientListView(list_ingredient: listIngredient, list_grammage: listGrammage,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
