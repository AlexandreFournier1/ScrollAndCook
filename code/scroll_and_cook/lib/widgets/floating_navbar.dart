import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:scroll_and_cook/screens/catalogue_perso_screen.dart';
import 'package:scroll_and_cook/screens/catalogue_screen.dart';
import 'package:scroll_and_cook/screens/profil_screen.dart';
import 'package:scroll_and_cook/screens/reseau_social_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';


class FloatingNavbar extends StatefulWidget {
  const FloatingNavbar({
    super.key, required String idUtilisateur, required int whatPage}) : _idUtilisateur = idUtilisateur, _whatPage = whatPage;

  final String _idUtilisateur;
  final int _whatPage;
  @override
  State<FloatingNavbar> createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: kSizeFloatingNavbar,
      width: MediaQuery.of(context).size.width * 0.70,
      padding: EdgeInsets.only(right: kNormalPadding, left: kNormalPadding),
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: kNormalRadius,
        boxShadow: [
          BoxShadow(
            color: kBlackColor,
            blurRadius: kBlurRadius,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: GNav(
        padding: EdgeInsets.symmetric(horizontal: kNormalPadding, vertical: kNormalPadding),
        tabMargin: EdgeInsets.symmetric(horizontal: kNormalPadding, vertical: kNormalPadding),
        tabActiveBorder: Border.all(color: kBlackColor, width: 1),
        tabBorder: Border.all(
          color: kSecondColor,
          width: 1,
        ),
        activeColor: kBlackColor,
        color: kBlackColor,
        tabs: [
          GButton(icon: Icons.home,),
          GButton(icon: Icons.library_books_outlined),
          GButton(icon: Icons.menu_book),
          GButton(icon: Icons.person),
        ],
        selectedIndex: widget._whatPage,
        onTabChange: (value) {
          setState(() {
            switch(value) {
              case 0: Navigator.pushNamed(context, ReseauSocialScreen.routeName);
              break;
              case 1: Navigator.pushNamed(context, CatalogueScreen.routeName);
              break;
              case 2: Navigator.pushNamed(context, CataloguePersoScreen.routeName);
              break;
              case 3:
                Navigator.push(
                  context,
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          ProfilScreen(
                            isPersonalProfile: true,
                            idUtilisateur: widget._idUtilisateur,
                          )
                    )
                );
              break;
            }
          });
        },
      ),
    );
  }
}

