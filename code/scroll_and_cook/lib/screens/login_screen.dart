import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_link.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/input/custom_password_input.dart';
import 'package:scroll_and_cook/widgets/input/custom_text_input.dart';

import '../widgets/button/back_button.dart';
import 'catalogue_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static final _formKey = GlobalKey<FormState>();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    bool isPassword = true;

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
          child: SizedBox(
            height:  MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      WBackButton(),
                      SizedBox(
                        height: kHeightBetweenElement,
                      ),
                      Center(
                        child: CustomImage(
                          size: kLogoSize,
                          path: 'assets/icons/logo.png',
                          assetOrNot: true,
                        ),
                      ),
                      SizedBox(
                        height: kHeightBetweenElement,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kHorizontalPaddingFormInput
                        ),
                        child: Form(
                            key: LoginScreen._formKey,
                            child: Column(
                              children: [
                                CustomTextInput(
                                  controller: emailController,
                                  validator: (String? value) {},
                                  label: "Adresse mail",
                                  hint: "Ex: johndoe@example.com",
                                  isEmail: true,
                                ),
                                CustomPasswordInput(
                                  controller: passwordController,
                                  validator: (String? value) {},
                                  label: "Mot de passe",
                                  hint: "**************",
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kHorizontalPaddingFormButton
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButton(
                              onTapFunction: () async {
                                if(LoginScreen._formKey.currentState!.validate()) {
                                  String identifiant = emailController.text;
                                  String mdp = passwordController.text;
                                  try {
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: identifiant,
                                      password: mdp,
                                    ).then((value){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Connection réussie"),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );

                                      Navigator.pushNamed(context, CatalogueScreen.routeName);
                                    });
                                  } catch(e) {
                                    if(context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Erreur d'indentifiant et/ou de mdp")),
                                      );
                                    }
                                  }
                                }
                              },
                              label: "Se connecter"
                          ),
                        ),
                      ),

                      Spacer(),
                  
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                        child: CustomLink(
                          onTapFunction: () {
                            Navigator.pushNamed(
                                context, CatalogueScreen.routeName);
                          },
                          label: "Se crée un compte",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
