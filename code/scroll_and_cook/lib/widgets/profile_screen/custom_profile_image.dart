import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';
import 'package:scroll_and_cook/widgets/button/custom_bottom_icon.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage({
    super.key,
    required FirestoreODM<AppSchema> db,
    required String idUtilisateur,
  }) : _db = db, _idUtilisateur = idUtilisateur;

  final String _idUtilisateur;
  final FirestoreODM<AppSchema> _db;

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {
  @override
  Widget build(BuildContext context) {
    final List<String> image = [
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/person.png",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/femme1.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/femme2.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/femme3.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/homme1.jpg",
      "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/homme2.jpg"
    ];

    String imageSelected = "";

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kNormalPadding
          ),
          child: SizedBox(width: 1,),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: kNormalRadius
                ),
                margin: const EdgeInsets.all(kNormalPadding),
                width: 300,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  children: [
                    Text("Choisissez une image de profil", style: kMainTextRecetteScreen),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: kLargePadding),
                        itemCount: image.length,
                        itemBuilder: (context, index) {
                          final img = image[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                imageSelected = img;
                              });
                              MyCustomSnackBar(context, "Vous avez sélectionner une image !");
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kNormalPadding
                              ),
                              child: CustomImage(
                                  size: kSizeProfilePicture,
                                  path: img,
                                  assetOrNot: false
                              ),
                            )
                          );
                        },
                      ),
                    ),
                    FutureBuilder(
                      future: widget._db.users(widget._idUtilisateur).get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text('Erreur : ${snapshot.error}');
                        }

                        String? imagePath = snapshot.data?.profileImagePath;

                        return MyCustomBottomIcon(
                          validOnTap: () async {
                          if (imageSelected.isEmpty) {
                            MyCustomSnackBar(context, "Veuillez sélectionner une image");
                            return;
                          }

                          final user = snapshot.data!;
                          final userRef = widget._db.users(widget._idUtilisateur);

                          await userRef.update(
                            user.copyWith(profileImagePath: imageSelected),
                          );

                          MyCustomSnackBar(context, "Votre image de profil a été changée !");
                          Navigator.pop(context);
                        },
                        );
                      }
                    )
                  ],
                ),
              ),
            )
          ),
          child: StreamBuilder(
            stream: widget._db.users(widget._idUtilisateur).stream,
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

              return Padding(
                  padding: const EdgeInsets.all(kLargePadding),
                  child: CustomImage(
                    size: kSizeProfilePicture,
                    path: user.profileImagePath,
                    assetOrNot: false,
                  )
              );
            }
          ),
        ),
      ],
    );
  }
}