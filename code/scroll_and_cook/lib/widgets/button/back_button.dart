import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/catalogue_perso_screen.dart';
import 'package:scroll_and_cook/screens/catalogue_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';

class WBackButton extends StatelessWidget {
  const WBackButton({
    super.key,
    bool? catalogueRedirection,
    bool? cataloguePersoRedirection,
  }) : _catalogueRedirection = catalogueRedirection, _cataloguePersoRedirection = cataloguePersoRedirection;

  final bool? _catalogueRedirection;
  final bool? _cataloguePersoRedirection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kButtonHorizontalPadding
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (_catalogueRedirection == true) {
              Navigator.pushNamed(context, CatalogueScreen.routeName);
            } else if (_cataloguePersoRedirection == true) {
              Navigator.pushNamed(context, CataloguePersoScreen.routeName);
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kCircleRadius,
                border: Border.all(width:kBorderWidth, color: kWhiteColor)
            ),
            child: Padding(
              padding: const EdgeInsets.all(kHorizontalPadding),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
    );
  }
}