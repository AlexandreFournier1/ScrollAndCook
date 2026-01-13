import 'package:dto/dto.dart';
import 'package:dto/model/recipe.dart';
import 'package:dto/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';
import 'package:scroll_and_cook/widgets/builder/list_conversation.dart';
import 'package:scroll_and_cook/widgets/button/custom_elevated_button.dart';
import 'package:scroll_and_cook/widgets/social_screen/custom_first_comment_dialog.dart';
import 'package:scroll_and_cook/widgets/icon/custom_icon_box.dart';

class InteractionIconPostSocialScreen extends StatelessWidget {
  const InteractionIconPostSocialScreen({
    super.key,
    required String title,
    required String idRecette,
    required FirestoreODM<AppSchema> db,
    required Recipe recipe,

    required String? profilePicture,
    required String? image,
    required String? idUtilisateur,

    required String connectedUserId,
  }) : _title = title, _idRecette = idRecette, _db = db, _recipe = recipe, _connectedUserId = connectedUserId
  , _idUtilisateur = idUtilisateur, _image = image, _profilePicture = profilePicture;

  final String _connectedUserId;
  final String _title;
  final String _idRecette;
  final FirestoreODM<AppSchema> _db;
  final Recipe _recipe;

  final String? _profilePicture;
  final String? _image;
  final String? _idUtilisateur;

  @override
  Widget build(BuildContext context) {
    final connectedUserId = FirebaseAuth.instance.currentUser?.uid;

    if (connectedUserId == null) {
      return const Text("Aucun utilisateur connecté");
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kLargePadding,
                horizontal: kBigPadding
            ),
            child: FutureBuilder(
                future: _db.users(connectedUserId).get(),
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

                      bool hasLiked = false;

                      for(User u in users) {
                        if (u.id == _connectedUserId) {
                          hasLiked = true;
                        }
                      }

                      return MyIconBox(
                          onTap: [
                            () async {
                              if (hasLiked) {
                                await _db.recipes(_idRecette).update(_recipe.copyWith(
                                  nbLike: _recipe.nbLike - 1
                                ));
                                await _db.recipes(_idRecette).like(_connectedUserId).delete();
                                MyCustomSnackBar(context, "Vous avez retiré votre like du post $_title");
                              } else {
                                MyCustomSnackBar(context, "Double-cliquez 2 fois sur l'image pour liker !");
                              }
                              /*else {
                                await _db.recipes(_idRecette).update(_recipe.copyWith(
                                    nbLike: _recipe.nbLike + 1
                                ));
                                await _db.recipes(_idRecette).like.insert(
                                  User(
                                    id: user!.id,
                                    username: user.username,
                                    email: user.email,
                                    profileImagePath: user.profileImagePath,
                                    nbPublications: user.nbPublications,
                                    nbAmis: user.nbAmis,
                                    hasMessage: user.hasMessage,
                                  ),
                                );
                                MyCustomSnackBar(context, "Vous avez liké le post $_title");
                              }*/
                            },
                                () async => showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomFirstCommentsDialog(
                                db: _db,
                                idRecette: _idRecette,
                                titre: _title,
                                idCurrentUser: connectedUserId,
                              ),
                            ),
                                () async => showDialog(
                              context: context,
                              builder: (BuildContext context) => Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.42, bottom: MediaQuery.of(context).size.height * 0.42, left: MediaQuery.of(context).size.width * 0.35, right: MediaQuery.of(context).size.width * 0.35),
                                child: MyCustomElevatedButton(
                                  color: kSecondColor,
                                  size: kSizeButtonMessageDialog,
                                  isIcon: false,
                                  title: "Send",
                                  elementBox: [
                                    SizedBox(height: kHalfHeightBetweenElement,),
                                    Text('Envoyer à un de vos amis',
                                        style: kMainTextCreateRecette
                                    ),
                                    SizedBox(height: kHalfHeightBetweenElement,),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.5,
                                      child: ListConversation(creation: false, isEnvoyer: true,
                                      idRecipe: _recipe.id, imageRecipe: _recipe.image, ownerRecipe: _idUtilisateur, titleRecipe: _title, ownerRecipeImage: _profilePicture,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          list: [
                            if (hasLiked) Icons.thumb_down
                            else Icons.thumb_up,
                            //hasLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                            Icons.comment,
                            Icons.send
                          ],
                          size: kIconSize
                      );
                    }
                  );
                }
            )
        ),
        StreamBuilder(
          stream: _db.users(connectedUserId).savedRecipes.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Text("Erreur : ${snapshot.error}");
            }

            final recipes = snapshot.data ?? [];
            bool hasRecipeSaved = false;

            for (Recipe r in recipes) {
              if (r.id == _idRecette) {
                hasRecipeSaved = true;
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kLargePadding,
                  horizontal: kBigPadding
              ),
              child: MyIconBox(
                onTap: [
                  () async {
                  if (hasRecipeSaved) {
                    await _db.users(connectedUserId).savedRecipes(_idRecette).delete();

                    MyCustomSnackBar(context, "Vous avez retiré la recette $_title de vos enregistrement");
                  }
                  else {
                    await _db.users(connectedUserId).savedRecipes.insert(_recipe);

                    MyCustomSnackBar(context, "Vous avez enregistré la recette $_title");
                  }
                  }
                ],
                list: [
                  hasRecipeSaved ? Icons.bookmark_added : Icons.bookmark_add_outlined
                ],
                size: kIconSize,
              ),
            );
          }
        ),
      ],
    );
  }
}