import 'package:flutter/material.dart';

// BoxShadow
const BoxShadow kBoxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.3),
    blurRadius: 7,
    offset: Offset(4, 8)
);

const BoxShadow kBoxShadowDisabled = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0),
    blurRadius: 0,
    offset: Offset(0, 0)
);

// Blur radius
const double kBlurRadius = 4.0;

// Max Lines Text
const int kMaxLinesUsernameProfile = 3;
const int kMaxLinesIngredient = 2;

// Positioned
const double kRightPositionedFloatingNavBar = 0;
const double kLeftPositionedFloatingNavBar = 0;
const double kBottomPositionedFloatingNavBar = 30;