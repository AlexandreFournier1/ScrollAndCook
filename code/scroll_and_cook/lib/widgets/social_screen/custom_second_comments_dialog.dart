import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/social_screen/profil_link_social_screen.dart';

class CustomSecondCommentsDialog extends StatelessWidget {
  const CustomSecondCommentsDialog({super.key, required String recipeId}) : _recipeId = recipeId;

  final String _recipeId;

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    return Dialog(
      child: Container(
        margin: const EdgeInsets.all(kSecondCommentPadding),
        width: 300,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: kNormalRadius,
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              "Commentaires",
              style: kMainTextReseauSocial,
            ),
            const SizedBox(height: 12),
              Expanded(
                child: StreamBuilder(
                  stream: db.recipes(_recipeId).comments.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Text("Erreur : ${snapshot.error}");
                    }

                    final comments = snapshot.data ?? [];

                    if (comments.isEmpty) {
                      return Center(
                        child: Text(
                          "Pas de commentaire pour le moment\nSoyez le premier !",
                          textAlign: TextAlign.center,
                          style: kTextVideCreateRecette,
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: db.recipes(_recipeId).comments(comment.id).users.get(),
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

                                final image = users.first.profileImagePath;
                                final id = users.first.id;

                                return ProfilLinkSocialScreen(profilePicture: image, idUtilisateur: id);
                              }
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kNormalPadding,
                                  vertical: kCommentPadding,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(kNormalPadding),
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: kMiniRadius,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: kBlurRadius,
                                      )
                                    ],
                                  ),
                                  child: Text(
                                    comment.txt,
                                    style: kTextListView,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close,
                  color: kRedColor, size: kIconSize * 2
              ),
            )
          ],
        ),
      ),
    );
  }
}
