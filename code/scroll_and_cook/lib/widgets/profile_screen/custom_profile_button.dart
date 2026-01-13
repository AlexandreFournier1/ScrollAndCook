import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/ingredient.dart';
import 'package:dto/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:scroll_and_cook/screens/messagerie_screen.dart';
import 'package:scroll_and_cook/screens/welcome_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/radius.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/util/custom_snackbar.dart';
import 'package:scroll_and_cook/util/get_ingredients_db.dart';
import 'package:scroll_and_cook/util/get_isfriend.dart';
import 'package:scroll_and_cook/widgets/button/custom_bottom_icon.dart';
import 'package:scroll_and_cook/widgets/button/custom_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_button_icon.dart';
import 'package:scroll_and_cook/widgets/input/custom_text_input.dart';

class CustomProfileButton extends StatefulWidget {
  const CustomProfileButton({
    super.key,
    required FirestoreODM<AppSchema> db,
    required bool isPersonalProfile,
    required String idUtilisateur,
  }) : _db = db, _isPersonalProfile = isPersonalProfile, _idUtilisateur = idUtilisateur;

  final bool _isPersonalProfile;
  final String _idUtilisateur;
  final FirestoreODM<AppSchema> _db;

  @override
  State<CustomProfileButton> createState() => _CustomProfileButtonState();
}

class _CustomProfileButtonState extends State<CustomProfileButton> {
  late final TextEditingController usernameController;

  String labelTextIngredient = "Vos ingrédients permanents";
  String selectedIngredient = "";

  late Future<List<String>> ingredientFromDb;

  @override
  void initState() {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    super.initState();
    usernameController = TextEditingController();

    ingredientFromDb = getIngredientFromDb(db, "");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: kLargePadding
                ),
                child: Column(
                  children: [
                    CustomButton(
                      onTapFunction: widget._isPersonalProfile
                        ? () => showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: kNormalRadius
                                ),
                                margin: const EdgeInsets.all(kNormalPadding),
                                width: kSizeProfileButtonDialog,
                                height: MediaQuery.of(context).size.height / 4,
                                child: Column(
                                    children: [
                                      Text("Modifiez votre profil", style: kMainTextRecetteScreen),
                                      CustomTextInput(
                                        controller: usernameController,
                                        validator: (_) {},
                                        label: "Username",
                                        hint: "",
                                        isEmail: false,
                                      ),
                                      FutureBuilder(
                                          future: widget._db.users(widget._idUtilisateur).get(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return const CircularProgressIndicator();
                                            }

                                            if (snapshot.hasError) {
                                              return Text('Erreur : ${snapshot.error}');
                                            }

                                            final user = snapshot.data;
                                            final userRef = widget._db.users(widget._idUtilisateur);
                                            return MyCustomBottomIcon(
                                              validOnTap: () async {
                                                await userRef.update(
                                                  user!.copyWith(username: usernameController.text),
                                                );
                                                MyCustomSnackBar(context, "Votre username est maintenant : ${usernameController.text}");
                                                Navigator.pop(context);
                                              },
                                            );
                                          }
                                      )
                                    ]
                                )
                            ),
                          )
                        )
                          : () async {
                        final connectedUserId = FirebaseAuth.instance.currentUser?.uid;

                        final copain = await widget._db.users(connectedUserId!).friends.doc(widget._idUtilisateur).get();

                        if(copain != null) {MyCustomSnackBar(context, "Vous êtes déjà copain !");return;}

                        final friendData = await widget._db.users(widget._idUtilisateur).get();
                        final connectedUser = await widget._db.users(connectedUserId).get();

                        widget._db.users(connectedUserId).friends.insert(friendData!);
                        widget._db.users(widget._idUtilisateur).friends.insert(connectedUser!);

                        widget._db.users(connectedUserId).update(connectedUser.copyWith(nbAmis: connectedUser.nbAmis+1));
                        widget._db.users(widget._idUtilisateur).update(friendData.copyWith(nbAmis: friendData.nbAmis+1));

                        MyCustomSnackBar(context, "Ami ajouté");
                      },

                      label: widget._isPersonalProfile
                          ? "Modifier Profil"
                          : "Ajouter Amis",

                      style: kTextButtonReseauSocial,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kNormalPadding,
                    horizontal: kLargePadding
                ),
                child: CustomButton(
                  onTapFunction: widget._isPersonalProfile
                      ? () => showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Container(
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: kNormalRadius
                            ),
                            margin: const EdgeInsets.all(kNormalPadding),
                            width: kSizeProfileButtonDialog,
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: Column(
                              children: [
                                Text("Ajouter vos ingrédients permanents", style: kMainTextReseauSocial),
                                Padding(
                                  padding: const EdgeInsets.all(kNormalPadding),
                                  child: Text("Cliquez sur l'ingrédient pour qu'il soit pris en compte", style: kTextCommentaireProfil),
                                ),
                                FutureBuilder(
                                  future: ingredientFromDb,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }

                                    if (snapshot.hasError) {
                                      return Text('Erreur 1 : ${snapshot.error}');
                                    }

                                    final ingredients = snapshot.data ?? [];

                                    return TypeAheadField<String>(
                                      suggestionsCallback: (pattern) async {
                                        return ingredients
                                            .where((item) => item
                                            .toLowerCase()
                                            .contains(pattern.toLowerCase()))
                                            .toList();
                                      },
                                      builder: (context, controller, focusNode) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius: kNormalRadius
                                          ),
                                          child: TextField(
                                            controller: controller,
                                            focusNode: focusNode,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: kNormalRadius
                                              ),
                                              labelText: labelTextIngredient,
                                              hintText: selectedIngredient
                                            ),
                                          ),
                                        );
                                      },
                                      itemBuilder: (context, ingredient) {
                                        return ListTile(
                                          title: Text(ingredient),
                                        );
                                      },

                                      onSelected: (suggestion) {
                                        selectedIngredient = suggestion;
                                        labelTextIngredient = suggestion;
                                      },
                                      hideOnLoading: true,
                                      hideOnError: true,
                                      hideOnEmpty: true,
                                    );
                                  }
                                ),
                                MyCustomBottomIcon(
                                  validOnTap: () async {
                                    final newIngredient = Ingredient(
                                      id: "permanentingredientfrom_${widget._idUtilisateur}_${selectedIngredient.toLowerCase()}",
                                      name: selectedIngredient,
                                      type: "",
                                      quantity: "-1"
                                    );

                                    await widget._db.users(widget._idUtilisateur).permanentIngredients.insert(newIngredient);

                                    MyCustomSnackBar(context, "Vous avez ajouter $selectedIngredient comme nouvel ingrédient permanent !");

                                    setState(() {});

                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      )
                      : () async {
                    final connectedUserId =  FirebaseAuth.instance.currentUser!.uid;
                    final isFriend = await getIsFriendFromDb(widget._db, connectedUserId, widget._idUtilisateur);
                    if(isFriend == true){

                      final friendData = await widget._db.users(widget._idUtilisateur).friends(connectedUserId).get();
                      final connectedUser = await widget._db.users(connectedUserId).friends(widget._idUtilisateur).get();

                      await widget._db.users(connectedUserId).friends(widget._idUtilisateur).update(connectedUser!.copyWith(hasMessage: true));

                      await widget._db.users(widget._idUtilisateur).friends(connectedUserId).update(friendData!.copyWith(hasMessage: true));

                      final result = await widget._db.users(connectedUserId).friends(widget._idUtilisateur).messages.get();

                      if(result.isEmpty) {
                        Message message = Message(
                          id: FirestoreODM.autoGeneratedId,
                          text: "Dite bonjour a votre ami",
                          isSentByMe: true,
                          createdAt: DateTime.now(),
                          type: "text",
                        );

                        await widget._db.users(connectedUserId).friends(widget._idUtilisateur).messages.insert(message);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) =>
                                  MessagerieScreen(
                                    idFriend: widget._idUtilisateur,
                                  )
                          )
                      );
                    } else {
                      return MyCustomSnackBar(context, "Vous n'êtes pas ami");
                    }
                  },
                  label: widget._isPersonalProfile
                      ? "Ingrédient Permanent"
                      : "Envoyer un Message",
                  style: kTextButtonReseauSocial,
                ),
              ),
              widget._isPersonalProfile ?
              CustomButtonIcon(
                onTapFunction: () async => showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: kNormalRadius
                        ),
                        margin: const EdgeInsets.all(kNormalPadding),
                        width: kSizeProfileButtonDialog,
                        height: kSizeDisconnectDialog,
                        child: Column(
                          children: [
                            Text("Voulez vous vraiment vous déconnecter ?", style: kMainTextRecetteScreen),
                            MyCustomBottomIcon(
                              validOnTap: () async {
                                await FirebaseAuth.instance.signOut();
                                final userId = FirebaseAuth.instance.currentUser?.uid;

                                if (userId == null) {
                                  Navigator.pushNamed(context, WelcomeScreen.routeName);
                                }
                              },
                            )
                          ]
                        ),
                      ),
                  )
                ),
                icon: Icons.output,
                color: kSecondColor,
                boxShadowDisable: false,
              )
                  : SizedBox()
            ]
        ),
      ),
    );
  }
}