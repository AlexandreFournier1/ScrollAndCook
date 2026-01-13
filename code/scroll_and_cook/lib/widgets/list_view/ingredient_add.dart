import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/get_ingredients_db.dart';
import 'package:scroll_and_cook/widgets/button/custom_button_icon.dart';
import 'package:scroll_and_cook/widgets/input/custom_combobox.dart';
import 'package:scroll_and_cook/widgets/text_box_rectangular.dart';

class IngredientAdd extends StatefulWidget {
  const IngredientAdd({
    super.key,
    required List<String> listIgredients,
    required TextEditingController listController,
    required String typeIngredient,
    required FirestoreODM<AppSchema> db
  }) : _listIgredients = listIgredients,
        _listController = listController,
        _typeIngredient = typeIngredient,
        _db = db;

  final List<String> _listIgredients;
  final TextEditingController _listController;
  final String _typeIngredient;
  final FirestoreODM<AppSchema> _db;

  @override
  State<IngredientAdd> createState() => _IngredientAddState();
}

class _IngredientAddState extends State<IngredientAdd> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getIngredientFromDb(widget._db, widget._typeIngredient),
      builder: (context, snapshot) {

        final List<String> ingList = snapshot.data ?? [];

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kHorizontalPaddingFormInput
          ),
          child: Column(
            children: [
              RectangularTextBox(title: widget._typeIngredient, color: kSecondColor, align: Alignment.topLeft, leftpad: 0,),
              Row(
                children: [
                  Expanded(
                    child: CustomCombobox(
                      controller: widget._listController,
                      validator: (String? value) {},
                      label: "",
                      hint: "Vos " + widget._typeIngredient,
                      comboItems: ingList,
                    ),
                  ),
                  SizedBox(width: 3),
                  CustomButtonIcon (
                    onTapFunction: () {
                      setState(() {
                        if(widget._listController.text.isNotEmpty)
                          if(!widget._listIgredients.contains(widget._listController.text) )
                            widget._listIgredients.add(widget._listController.text);
                      });
        
                    },
                    icon: Icons.add_circle_outline,
                    color: kSecondColor,
                  ),
                ],
              ),
        
              SizedBox (
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: kMiniRadius,
                  ),
                  child: ListView.builder(
                    itemCount: widget._listIgredients.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Padding(
                          padding: EdgeInsets.only(left: kNormalPadding, top: kSmallPadding, bottom: kSmallPadding, right: kNormalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget._listIgredients[index]}', style: kTextListView,),
                              CustomButtonIcon(
                                onTapFunction: () {
                                  setState(() {
                                    widget._listIgredients.removeAt(index);
                                  });
                                },
                                icon: Icons.remove,
                                color: kWhiteColor,
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}