import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/fond_frigo_screen.dart';
import 'package:scroll_and_cook/screens/register_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/widgets/builder/list_popular_catalogue.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/floating_navbar_positioned.dart';
import 'package:scroll_and_cook/widgets/input/custom_research_input.dart';
import 'package:scroll_and_cook/widgets/text_box_rectangular.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  static const routeName = '/catalogue';
  @override
  Widget build(BuildContext context) {

    final TextEditingController researchController = TextEditingController();
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: Stack(
          children: [
            SafeArea(
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

                      SizedBox(height: kHeightBetweenElement,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kHugePadding),
                        child: CustomResearchTextInput(
                          controller: researchController,
                          label: "Recherche",
                          isRecipe: true,),
                      ),

                      SizedBox(height: kHalfHeightBetweenElement,),
                      RectangularTextBox(title: "Recettes Populaire",
                        color: kWhiteColor,
                        align: Alignment.centerLeft,
                        leftpad: kHorizontalPadding,),
                      SizedBox(height: kHalfHeightBetweenElement,),

                      ListPopularCatalogue(isPopular: true,),

                      SizedBox(height: kHalfHeightBetweenElement + 10,),
                      RectangularTextBox(title: "Nouvelles Recettes",
                        color: kWhiteColor,
                        align: Alignment.centerLeft,
                        leftpad: kHorizontalPadding,),
                      SizedBox(height: kHalfHeightBetweenElement,),

                      ListPopularCatalogue(isPopular: false,),

                      SizedBox(height: kHeightBetweenElement,),
                      if(userId != null) ... {
                        CustomButton(onTapFunction: () {
                          Navigator.pushNamed(
                              context, FondFrigoScreen.routeName);
                        }, label: "Fond de frigo")
                      }
                      else
                        ... {
                          CustomButton(onTapFunction: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          }, label: "Cree un compte")
                        },
                      SizedBox(height: kHeightBetweenElement * 3,),
                    ],
                  ),
                )
            ),
            if(userId != null) ...{
              FloatingNavbarWithPosition(idUtilisateur: userId, whatPage: 1,)
            }
          ]
      ),
    );
  }
}
