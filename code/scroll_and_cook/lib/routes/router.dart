import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/catalogue_perso_screen.dart';
import 'package:scroll_and_cook/screens/catalogue_screen.dart';
import 'package:scroll_and_cook/screens/create_recette_screen.dart';
import 'package:scroll_and_cook/screens/login_screen.dart';
import 'package:scroll_and_cook/screens/messagerie_menu_screen.dart';
import 'package:scroll_and_cook/screens/messagerie_screen.dart';
import 'package:scroll_and_cook/screens/register_screen.dart';
import 'package:scroll_and_cook/screens/reseau_social_screen.dart';
import 'package:scroll_and_cook/screens/result_research_friend_screen.dart';
import 'package:scroll_and_cook/screens/result_research_recipe_screen.dart';
import 'package:scroll_and_cook/screens/welcome_screen.dart';

import '../screens/fond_frigo_screen.dart';


Map<String, WidgetBuilder> router = {
  WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  RegisterScreen.routeName: (BuildContext context) => RegisterScreen(),
  CatalogueScreen.routeName: (BuildContext context) => CatalogueScreen(),
  ResultResearchFriendScreen.routeName: (BuildContext context) => ResultResearchFriendScreen(),
  ResultResearchRecipeScreen.routeName: (BuildContext context) => ResultResearchRecipeScreen(),
  MessagerieMenuScreen.routeName: (BuildContext context) => MessagerieMenuScreen(),
  //RecetteScreen.routeName: (BuildContext context) => RecetteScreen(),
  FondFrigoScreen.routeName: (BuildContext context) => FondFrigoScreen(),
  ReseauSocialScreen.routeName: (BuildContext context) => ReseauSocialScreen(),
  CreateRecetteScreen.routeName: (BuildContext context) => CreateRecetteScreen(),
  CataloguePersoScreen.routeName: (BuildContext context) => CataloguePersoScreen(),
};