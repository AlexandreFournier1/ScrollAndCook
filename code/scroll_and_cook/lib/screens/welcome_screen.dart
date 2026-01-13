import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/catalogue_screen.dart';
import 'package:scroll_and_cook/screens/login_screen.dart';
import 'package:scroll_and_cook/screens/register_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_link.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return const CatalogueScreen();
        }
        return Scaffold(
          backgroundColor: kMainBackgroundColor,
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/plat_logo_welcome_screen.png'),
                          )
                      ),
                      height: kPlatWelcomeScreenSize,
                    ),
                    CustomButton(
                      onTapFunction: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      label: "Se connecter",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kPaddingOuText),
                      child: Text(
                        "Ou",
                        style: kTextWelcomeScreen,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: kHugePadding
                      ),
                      child: CustomButton(
                        onTapFunction: () {
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        label: "Créer un compte",
                      ),
                    ),
                    CustomLink(
                      onTapFunction: () {
                        Navigator.pushNamed(context, CatalogueScreen.routeName);
                      },
                      label: "Continuer sans compte",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}