import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/result_research_friend_screen.dart';
import 'package:scroll_and_cook/screens/result_research_recipe_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class CustomResearchTextInput extends StatelessWidget {
  const CustomResearchTextInput({
    super.key,
    required TextEditingController controller,
    required String label,
    required bool isRecipe
  }) : _controller = controller, _label = label, _isRecipe = isRecipe;

  final TextEditingController _controller;
  final String _label;
  final bool _isRecipe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        vertical: kVerticalPaddingFormInput
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: _controller,
          validator: (String? value) {},
          decoration: InputDecoration(
            labelText: _label,
            labelStyle: kTextTextInput,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
                borderRadius: kNormalRadius
            ),
            filled: true,
            fillColor: kWhiteColor,
            suffixIcon: IconButton(
              onPressed:() {
                if(_isRecipe){
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            ResultResearchRecipeScreen(
                              textResearch: _controller.text,
                            ),
                      )
                  );
                } else if(!_isRecipe){
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            ResultResearchFriendScreen(
                              textResearch: _controller.text,
                            ),
                      )
                  );
                }
              },
              icon: Icon(
                Icons.search,
              )
            ),
          ),
        ),
      ),
    );
  }
}
