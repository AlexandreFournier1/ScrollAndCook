import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/user.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/catalogue_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_link.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/input/custom_password_input.dart';
import 'package:scroll_and_cook/widgets/input/custom_text_input.dart';

import 'package:firebase_auth/firebase_auth.dart' hide User;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
  static final _formKey = GlobalKey<FormState>();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController identifiantController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    identifiantController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                      key: RegisterScreen._formKey,
                      child: Column(
                        children: [
                          CustomTextInput(
                            controller: identifiantController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Veuillez saisir votre identifiant";
                              }
                              return null;
                            },
                            label: "Identifiant",
                            hint: "Ex: johndoe",
                            isEmail: false,
                          ),
                          CustomTextInput(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Veuillez saisir votre adresse mail";
                              }
                              if (!value.contains("@")) {
                                return "Veuillez saisir une adresse mail valide";
                              }
                              return null;
                            },
                            label: "Adresse mail",
                            hint: "Ex: johndoe@example.com",
                            isEmail: true,
                          ),
                          CustomPasswordInput(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Veuillez saisir votre mot de passe";
                                }
                                return null;
                              },
                              label: "Mot de passe",
                              hint: "**************"
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
                            if (RegisterScreen._formKey.currentState!.validate()) {
                              final db = FirestoreODM(
                                appSchema,
                                firestore: FirebaseFirestore.instance,
                              );
              
                              try {
                                String username = identifiantController.text;
                                String email = emailController.text;
                                String password = passwordController.text;
                                String image = 'https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/person.png';
              
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                ).then((authResult) async {
                                  String uid = authResult.user!.uid;
              
                                  await db.users.insert(
                                    User(
                                      id: uid,
                                      username: username,
                                      email: email,
                                      profileImagePath: image,
                                      nbAmis: 0,
                                      nbPublications: 0,
                                      hasMessage: false
                                    ),
                                  ).then((onValue) async {
                                    Navigator.pushNamed(
                                      context,
                                      CatalogueScreen.routeName,
                                    );
                                  });
                                });
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    showCloseIcon: true,
                                    duration: const Duration(seconds: 10),
                                    content: Text(e.message!),
                                  ),
                                );
                              }
                            }
                          },
                          label: "S'inscrire"
                      ),
                    ),
                  ),
                  SizedBox(height: kHeightBetweenElement * 2,),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                    child: CustomLink(
                      onTapFunction: () {
                        Navigator.pushNamed(context, CatalogueScreen.routeName);
                      },
                      label: "Se connecter",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
