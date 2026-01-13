import 'package:dto/dto.dart';
import 'package:dto/model/comment.dart';
import 'package:dto/model/user.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';
import 'package:scroll_and_cook/widgets/button/custom_bottom_icon.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/social_screen/custom_second_comments_dialog.dart';
import 'package:scroll_and_cook/widgets/input/custom_text_input.dart';

class CustomFirstCommentsDialog extends StatefulWidget {
  const CustomFirstCommentsDialog({
    super.key,
    required FirestoreODM<AppSchema> db,
    required String idRecette,
    required String titre,
    required String idCurrentUser,
  }) : _db = db, _idRecette = idRecette, _titre = titre, _idCurrentUser = idCurrentUser;

  final FirestoreODM<AppSchema> _db;
  final String _idRecette;
  final String _titre;
  final String _idCurrentUser;

  @override
  State<CustomFirstCommentsDialog> createState() => _CustomFirstCommentsDialogState();
}

class _CustomFirstCommentsDialogState extends State<CustomFirstCommentsDialog> {
  late final TextEditingController commentController;

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
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: kNormalRadius
        ),
        margin: const EdgeInsets.all(kNormalPadding),
        width: kSizeCommentDialog,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Entrez votre commentaire",
              style: kMainTextReseauSocial,
            ),
            CustomTextInput(
              controller: commentController,
              validator: (_) {},
              label: "Commentaire",
              hint: "ex:Trop bon !",
              isEmail: false,
            ),
            CustomButton(
              label: "Voir les commentaires",
              boxShadowDisable: true,
              onTapFunction: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomSecondCommentsDialog(
                    recipeId: widget._idRecette,
                  ),
                );
              },
            ),
            MyCustomBottomIcon(
              validOnTap: () async {
                final id = "${widget._idRecette}-${commentController.text.toLowerCase().replaceAll(RegExp(r'\s+'), '')}";
                final comment = Comment(
                    id: id,
                    txt: commentController.text
                );

                if (widget._idRecette != "" || widget._idRecette.isNotEmpty) {
                  widget._db.recipes(widget._idRecette).comments.insert(comment);

                  final User? user = await widget._db.users(widget._idCurrentUser).get();

                  if (user == null) {
                    MyCustomSnackBar(context, "Utilisateur introuvable ${widget._idCurrentUser}");
                    return;
                  }

                  await widget._db.recipes(widget._idRecette).comments(id).users.insert(user);
                }

                MyCustomSnackBar(context, "Vous avez commenté le post ${widget._titre}");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}