import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/texts.dart';

class MyProfileStat extends StatelessWidget {
  const MyProfileStat({
    super.key,
    required int nbPublications,
    required Widget nbFriends,
  }) : _nbPublications = nbPublications, _nbFriends = nbFriends;

  final int _nbPublications;
  final Widget _nbFriends;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: kMinimalRadius
      ),
      child: Padding(
        padding: const EdgeInsets.all(kLargePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kLargePadding
              ),
              child: Column(
                children: [
                  Text(
                      _nbPublications.toString(),
                      style: kTextProfileScreen
                  ),
                  Text("publications", style: kTextProfileScreen,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kLargePadding
              ),
              child: Column(
                children: [
                  _nbFriends,
                  Text("amis", style: kTextProfileScreen,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}