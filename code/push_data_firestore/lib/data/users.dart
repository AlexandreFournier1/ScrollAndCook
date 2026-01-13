import 'package:dto/model/user.dart';

String generateId(String username) {
  final now = DateTime.now().microsecondsSinceEpoch;
  final random = DateTime.now().millisecondsSinceEpoch.remainder(1000000);
  return '${username.toLowerCase().replaceAll(" ", "")}_${now.toRadixString(36)}${random.toRadixString(36)}';
}

final List<User> users = [
  User(
    username: "AdaWong",
    email: "ada@wong.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/ada_wong.png",
    id: generateId("AdaWong"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
  User(
    username: "KyleCrane",
    email: "kyle@crane.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/kyle_crane.png",
    id: generateId("KyleCrane"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
  User(
    username: "MikaelaReid",
    email: "mikaela@reid.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/mikaela_reid.png",
    id: generateId("MikaelaReid"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
  User(
    username: "MaleniaTheBladeOfMiquella",
    email: "malenia@blade.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/malenia.png",
    id: generateId("MaleniaTheBladeOfMiquella"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
  User(
    username: "GeraldDeRiv",
    email: "gerald@deriv.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/gerald_de_riv.png",
    id: generateId("GeraldDeRiv"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
  User(
    username: "TeemoTheBush",
    email: "teemo@bush.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/teemo.png",
    id: generateId("TeemoTheBush"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
  User(
    username: "AmbessaMedarda",
    email: "ambessa@medarda.com",
    profileImagePath: "https://raw.githubusercontent.com/AlexandreFournier1/Image-Projet-Flutter/main/image_profil/ambessa.png",
    id: generateId("AmbessaMedarda"),
    nbPublications: 0,
    nbAmis: 0,
    hasMessage: false
  ),
];
