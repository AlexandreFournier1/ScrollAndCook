import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/builder/friend_count.dart';
import 'package:scroll_and_cook/widgets/custom_horizontal_line.dart';
import 'package:scroll_and_cook/widgets/profile_screen/custom_profile_button.dart';
import 'package:scroll_and_cook/widgets/profile_screen/custom_profile_image.dart';
import 'package:scroll_and_cook/widgets/profile_screen/custom_profile_stat.dart';
import 'package:scroll_and_cook/widgets/floating_navbar_positioned.dart';
import 'package:scroll_and_cook/widgets/social_screen/custom_post_item.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({
    super.key,
    required bool isPersonalProfile,
    required String idUtilisateur
  }) : _isPersonalProfile = isPersonalProfile, _idUtilisateur = idUtilisateur;

  static const routeName = '/profil';

  final bool _isPersonalProfile;
  final String _idUtilisateur;


  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
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

    final List<String> image = [
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/person.png",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/femme1.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/femme2.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/femme3.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/homme1.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/homme2.jpg"
    ];

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: db.users(widget._idUtilisateur).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Erreur : ${snapshot.error}');
                    }

                    final user = snapshot.data;

                    if (user == null) {
                      return Text("Une erreur est survenue lors du chargement de l'utilisateur");
                    }

                    return Column(
                      children: [
                        Row(
                          children: [
                            CustomProfileImage(db: db, idUtilisateur: widget._idUtilisateur),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(kNormalPadding),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 2,
                                        child: Text(
                                          user.username,
                                          style: kTextUsernameReseauSocial,
                                          maxLines: kMaxLinesUsernameProfile,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    SizedBox()
                                  ],
                                ),
                                MyProfileStat(
                                  nbPublications: user.nbPublications,
                                  nbFriends: FriendCount(userId: widget._idUtilisateur),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomProfileButton(
                          db: db,
                          isPersonalProfile: widget._isPersonalProfile,
                          idUtilisateur: widget._idUtilisateur
                        ),
                        CustomHorizontalLine(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kLargePadding
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: kNormalRadius
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kNormalPadding,
                                    vertical: kSmallPadding
                                ),
                                child: Text(
                                  widget._isPersonalProfile ? "Mes Posts" : "Ses Posts",
                                  style: kTextProfileScreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder(
                          future: db.recipes.get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }

                            if (snapshot.hasError) {
                              return Text('Erreur 1 : ${snapshot.error}');
                            }

                            final recipes = snapshot.data ?? [];

                            if (recipes.isEmpty) {
                              return Container(
                                color: Colors.white,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 200,
                                child: Center(
                                  child: Text(
                                    "Aucun posts pour l'instant",
                                    style: kTextVide,
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
                                      return const CircularProgressIndicator();
                                    }

                                    if (snapshot.hasError) {
                                      return Text('Erreur 1 : ${snapshot.error}');
                                    }

                                    final owner = snapshot.data!.first;

                                    if (owner.id == widget._idUtilisateur) {
                                      return Padding(
                                        padding: const EdgeInsets.all(kLargePadding),
                                        child: MyPostItem(
                                          profilePicture: owner.profileImagePath,
                                          title: elem.titre,
                                          image: elem.image,
                                          idUtilisateur: owner.id,
                                          idRecette: elem.id,
                                          isOnProfile: true,
                                          isOnPersonalProfile: widget._isPersonalProfile,
                                        ),
                                      );
                                    }
                                    else {
                                      return SizedBox();
                                    }
                                  }
                                )
                                  : SizedBox()
                              ).toList()
                            );
                          }
                        )
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
          FloatingNavbarWithPosition(idUtilisateur: userId, whatPage: 3,)
        ]
      ),
    );
  }
}

