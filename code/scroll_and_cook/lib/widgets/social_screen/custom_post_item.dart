import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/comment.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/widgets/social_screen/image_post_social_screen.dart';
import 'package:scroll_and_cook/widgets/social_screen/interaction_icons_post.dart';
import 'package:scroll_and_cook/widgets/social_screen/profil_link_social_screen.dart';
import 'package:scroll_and_cook/widgets/social_screen/title_post_social_screen.dart';

class MyPostItem extends StatefulWidget {
  const MyPostItem({
    super.key,
    required String profilePicture,
    required String title,
    required String image,
    required String idUtilisateur,
    required String idRecette,
    required bool isOnProfile, required bool isOnPersonalProfile,
  }) : _profilePicture = profilePicture, _title = title, _image = image, _idUtilisateur = idUtilisateur, _idRecette = idRecette, _isOnProfile = isOnProfile, _isOnPersonalProfile = isOnPersonalProfile;

  final String _profilePicture;
  final String _title;
  final String _image;

  final String _idUtilisateur;
  final String _idRecette;

  final bool _isOnProfile;
  final bool _isOnPersonalProfile;

  @override
  State<MyPostItem> createState() => _MyPostItemState();
}

class _MyPostItemState extends State<MyPostItem> {
  late final TextEditingController commentController;
  late final List<Comment> commentList;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    return StreamBuilder(
      stream: db.recipes(widget._idRecette).stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        }

        final recipe = snapshot.data;
        if (recipe == null) {
          return const Text("Recette introuvable");
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kLargePadding
          ),
          child: Column(
            children: [
               Row(
                children: [
                  widget._isOnProfile
                      ? SizedBox()
                      : FutureBuilder(
                        future: db.recipes(widget._idRecette).owners.get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return Text("Erreur : ${snapshot.error}");
                          }

                          final user = snapshot.data!.first;

                          return ProfilLinkSocialScreen(profilePicture: widget._profilePicture, idUtilisateur: user.id);
                        }
                      ),
                  TitlePostSocialScreen(title: widget._title),
                ],
              ),
              ImagePostSocialScreen(
                db: db,
                recipe: recipe,
                title: widget._title,
                idRecette: widget._idRecette,
                image: widget._image,
                connectedUserId: widget._idUtilisateur,
                isOnProfile: widget._isOnProfile,
                isOnPersonalProfile: widget._isOnPersonalProfile,
              ),
              widget._isOnProfile
                  ? SizedBox()
                  : InteractionIconPostSocialScreen(
                    db: db,
                    recipe: recipe,
                    title: widget._title,
                    idRecette: widget._idRecette,
                    connectedUserId: widget._idUtilisateur,
                    profilePicture: widget._profilePicture,
                    image: widget._image,
                    idUtilisateur: widget._idUtilisateur,
                  ),
            ],
          ),
        );
      },
    );
  }
}