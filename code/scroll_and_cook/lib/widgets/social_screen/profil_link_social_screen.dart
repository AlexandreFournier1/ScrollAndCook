import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/profil_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';

class ProfilLinkSocialScreen extends StatelessWidget {
  const ProfilLinkSocialScreen({
    super.key,
    required String profilePicture, required String idUtilisateur,
  }) : _profilePicture = profilePicture, _idUtilisateur = idUtilisateur;

  final String _profilePicture;
  final String _idUtilisateur;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kBigPadding,
          right: kNormalPadding,
          top: kNormalPadding,
          bottom: kNormalPadding
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) =>
                    ProfilScreen(
                      isPersonalProfile: false,
                      idUtilisateur: _idUtilisateur,
                    )
              )
          );
        },
        child: Container(
          width: kSizeProfilePictureRS,
          height: kSizeProfilePictureRS,
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: kCircleRadius,
              image: DecorationImage(
                  image: NetworkImage(_profilePicture)
              )
          ),
        ),
      ),
    );
  }
}