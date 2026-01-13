import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/messagerie_menu_screen.dart';
import 'package:scroll_and_cook/screens/result_research_friend_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/floating_navbar_positioned.dart';
import 'package:scroll_and_cook/widgets/icon/custom_icon_box.dart';
import 'package:scroll_and_cook/widgets/social_screen/custom_post_item.dart';

class ReseauSocialScreen extends StatefulWidget {
  const ReseauSocialScreen({super.key});

  static const routeName = '/reseau-social';

  @override
  State<ReseauSocialScreen> createState() => _ReseauSocialScreenState();
}

class _ReseauSocialScreenState extends State<ReseauSocialScreen> {
  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Text("Aucun utilisateur connecté");
    }

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(kLargePadding),
                            child: CustomImage(
                              path: "assets/icons/logo.png",
                              size: kSizeIconApp,
                              assetOrNot: true,
                            )
                        ),
                        Padding(
                            padding: const EdgeInsets.all(kLargePadding),
                            child: MyIconBox(
                                onTap: [
                                  () {
                                    Navigator.pushNamed(context, ResultResearchFriendScreen.routeName);
                                  },
                                  () {
                                    Navigator.pushNamed(context, MessagerieMenuScreen.routeName);
                                  }
                                ],
                                list: [
                                  Icons.search,
                                  Icons.message
                                ],
                                size: kIconSize
                            )
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream: db.recipes.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text('Erreur 1 : ${snapshot.error}');
                        }

                        final recipes = snapshot.data  ?? [];

                        if (recipes.isEmpty) {
                          return Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: kSizePostImage,
                            child: Center(
                              child: Text(
                                "Aucun posts pour l'instant\nSoyez le premier à partager une recette !",
                                style: kTextVide
                              ),
                            ),
                          );
                        }

                        return Column(
                          children: recipes.map((elem) => elem.isPosted
                            ? FutureBuilder(
                              future: db.recipes(elem.id).owners.get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  return Text('Erreur 2 : ${snapshot.error}');
                                }

                                final users = snapshot.data ?? [];

                                if (users.isEmpty) {
                                  return const SizedBox();
                                }

                                final idUser = users.first.id;

                                return FutureBuilder(
                                  future: db.users(idUser).get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    }

                                    if (snapshot.hasError) {
                                      return Text('Erreur 3 : ${snapshot.error}');
                                    }

                                    final recipeOwner = snapshot.data;
                                    if (recipeOwner == null) {
                                      return const SizedBox();
                                    }

                                    return MyPostItem(
                                      title: elem.titre,
                                      profilePicture: recipeOwner.profileImagePath,
                                      image: elem.image,
                                      idRecette: elem.id,
                                      idUtilisateur: idUser,
                                      isOnProfile: false,
                                      isOnPersonalProfile: false,
                                    );
                                  }
                                );
                              }
                            )
                            : SizedBox()
                          ).toList()
                        );
                      }
                    ),
                    SizedBox(height: kHeightBetweenElement * 3)
                  ],
                )
                ),
              ),
            ),
          FloatingNavbarWithPosition(idUtilisateur: userId, whatPage: 0,),
        ]
      ),
    );
  }
}