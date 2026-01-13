import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/other.dart';
import 'package:scroll_and_cook/widgets/floating_navbar.dart';

class FloatingNavbarWithPosition extends StatelessWidget {
  const FloatingNavbarWithPosition({
    super.key, required String idUtilisateur, required int whatPage
  }) : _idUtilisateur = idUtilisateur, _whatPage = whatPage;

  final String _idUtilisateur;
  final int _whatPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: kLeftPositionedFloatingNavBar,
      right: kRightPositionedFloatingNavBar,
      bottom: kBottomPositionedFloatingNavBar,
      child: Center(
        child: FloatingNavbar(idUtilisateur: _idUtilisateur, whatPage: _whatPage,),
      ),
    );
  }
}