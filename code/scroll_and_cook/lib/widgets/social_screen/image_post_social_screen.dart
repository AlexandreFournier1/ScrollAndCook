import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';
import 'package:dto/model/user.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/recette_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';

class ImagePostSocialScreen extends StatelessWidget {
  const ImagePostSocialScreen({
    super.key,
    required FirestoreODM<AppSchema> db,
    required Recipe recipe,
    required String title,
    required String idRecette,
    required String image,
    required String connectedUserId,
    required bool isOnProfile, bool? isOnPersonalProfile,
  }) : _db = db, _recipe = recipe, _title = title, _idRecette = idRecette, _image = image, _connectedUserId = connectedUserId, _isOnProfile = isOnProfile, _isOnPersonalProfile = isOnPersonalProfile;

  final String _title;
  final String _idRecette;
  final String _image;
  final FirestoreODM<AppSchema> _db;
  final Recipe _recipe;
  final String _connectedUserId;

  final bool _isOnProfile;
  final bool? _isOnPersonalProfile;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _db.users(_connectedUserId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text("Erreur : ${snapshot.error}");
          }

          final user = snapshot.data;

          if (_isOnProfile == true) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                      RecetteScreen(
                        isPersonalRecette: _isOnPersonalProfile == true ? true : false,
                        idRecette: _idRecette,
                        isJustCreated: false,
                      )
                  )
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: kBigPadding,
                    top: kNormalPadding,
                    bottom: kNormalPadding
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: kSizePostImage,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: kMinimalRadius,
                      image: DecorationImage(
                          image: NetworkImage(_image)
                      )
                  ),
                ),
              ),
            );
          } else {
            return StreamBuilder(
              stream: _db.recipes(_idRecette).like.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Text("Erreur : ${snapshot.error}");
                }

                final users = snapshot.data ?? [];

                bool userHasLiked = false;

                for(User u in users) {
                  if (u.id == _connectedUserId) {
                    userHasLiked = true;
                  }
                }

                return GestureDetector(
                  onDoubleTap: () async {
                    if (userHasLiked) {
                      MyCustomSnackBar(
                        context,
                        "Vous avez déjà liké le post $_title",
                      );
                    } else {
                      MyCustomSnackBar(
                        context,
                        "Vous avez liké le post $_title",
                      );

                      final recipeRef = _db.recipes(_idRecette);

                      await recipeRef.update(
                        _recipe.copyWith(nbLike: _recipe.nbLike + 1),
                      );

                      await _db.recipes(_idRecette).like.insert(user!);
                    }
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kBigPadding,
                        vertical: kSmallPadding
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: kSizePostImage,
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: kMinimalRadius,
                          image: DecorationImage(
                              image: NetworkImage(_image)
                          )
                      ),
                    ),
                  ),
                );
              }
            );
          }
        }
    );
  }
}