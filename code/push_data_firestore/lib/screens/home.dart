import 'package:dto/model/comment.dart';
import 'package:dto/model/ingredient.dart';
import 'package:dto/model/recipe.dart';
import 'package:dto/model/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:push_data_firestore/data/comments.dart';
import 'package:push_data_firestore/data/ingredients.dart';
import 'package:push_data_firestore/data/messages.dart';
import 'package:push_data_firestore/data/recipes.dart';
import 'package:push_data_firestore/data/users.dart';
import 'package:push_data_firestore/styles/spacings.dart';
import 'package:dto/dto.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _description = [];
  late final FirestoreODM odm;

  @override
  void initState() {
    super.initState();
    odm = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Center(
          child: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _description.map((e) => Text(e)).toList(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () async {
                await deleteCollections();
                await deleteUserFromFirebase();
              },
              label: const Row(
                children: [
                  Icon(Icons.delete_forever),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Supprimer les données"),
                ],
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await authenticateAndAddUser();
                //await addUsers();
                await addIngredients();
                await addPermanentIngredients();
                await addRecipes();
                await addSavedRecipes();
                await addCommentToRecipe();
                await addMessage();
              },
              label: const Row(
                children: [
                  Icon(Icons.published_with_changes),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Générer les données"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ****************************************************************************
  // DELETE
  Future<void> deleteCollections() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    final users = await db.users.get();
    for (final user in users) {
      final friends = await db.users(user.id).friends.get();
      for (final friend in friends) {
        final messages = await db.users(user.id).friends(friend.id).messages.get();
        for (final message in messages) {
          await db.users(user.id).friends(friend.id).messages(message.id).delete();
          setState(() {
            _description.insert(0,
                "Suppression du message ${message.id} du friend ${friend.id} de l'utilisateur ${user.id}");
          });
        }

        await db.users(user.id).friends(friend.id).delete();
        setState(() {
          _description.insert(
              0, "Suppression du friend ${friend.id} de l'utilisateur ${user.id}");
        });
      }

      final savedRecipes = await db.users(user.id).savedRecipes.get();
      for (final recipe in savedRecipes) {
        await db.users(user.id).savedRecipes(recipe.id).delete();
        setState(() {
          _description.insert(0,
              "Suppression de la recette sauvegardée ${recipe.id} de l'utilisateur ${user.id}");
        });
      }

      final ingredients = await db.users(user.id).permanentIngredients.get();
      for (final ingredient in ingredients) {
        await db.users(user.id).permanentIngredients(ingredient.id).delete();
        setState(() {
          _description.insert(0,
              "Suppression de l'ingrédient permanent ${ingredient.id} de l'utilisateur ${user.id}");
        });
      }

      await db.users(user.id).delete();
      setState(() {
        _description.insert(0, "Suppression de l'utilisateur ${user.id}");
      });
    }

    final recipes = await db.recipes.get();
    for (final recipe in recipes) {
      final owners = await db.recipes(recipe.id).owners.get();
      for (final owner in owners) {
        await db.recipes(recipe.id).owners(owner.id).delete();
        setState(() {
          _description.insert(0,
              "Suppression de l'owner ${owner.id} de la recette ${recipe.id}");
        });
      }

      final ingredients = await db.recipes(recipe.id).ingredients.get();
      for (final ingredient in ingredients) {
        await db.recipes(recipe.id).ingredients(ingredient.id).delete();
        setState(() {
          _description.insert(
              0, "Suppression de l'ingrédient ${ingredient.id} de la recette ${recipe.id}");
        });
      }

      final comments = await db.recipes(recipe.id).comments.get();
      for (final comment in comments) {
        final commentUsers =
        await db.recipes(recipe.id).comments(comment.id).users.get();
        for (final cUser in commentUsers) {
          await db.recipes(recipe.id)
              .comments(comment.id)
              .users(cUser.id)
              .delete();
          setState(() {
            _description.insert(0,
                "Suppression de l'utilisateur ${cUser.id} du commentaire ${comment.id}");
          });
        }

        await db.recipes(recipe.id).comments(comment.id).delete();
        setState(() {
          _description.insert(
              0, "Suppression du commentaire ${comment.id} de la recette ${recipe.id}");
        });
      }

      final likes = await db.recipes(recipe.id).like.get();
      for (final likeUser in likes) {
        await db.recipes(recipe.id).like(likeUser.id).delete();
        setState(() {
          _description.insert(
              0, "Suppression du like de l'utilisateur ${likeUser.id} de la recette ${recipe.id}");
        });
      }

      await db.recipes(recipe.id).delete();
      setState(() {
        _description.insert(0, "Suppression de la recette ${recipe.id}");
      });
    }

    final globalIngredients = await db.ingredients.get();
    for (final ingredient in globalIngredients) {
      await db.ingredients(ingredient.id).delete();
      setState(() {
        _description.insert(0, "Suppression de l'ingrédient global ${ingredient.id}");
      });
    }
  }

  Future<void> deleteUserFromFirebase() async {
    for (var user in users) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: user.email,
            password: "123456789"
        );

        final firebaseAuthUser = FirebaseAuth.instance.currentUser;

        if (firebaseAuthUser != null) {
          await firebaseAuthUser.delete();
          await FirebaseAuth.instance.signOut();
          setState(() {
            _description.insert(0, "Suppression de l'utilisateur Firebase ${user.id}");
          });
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _description.insert(0, "Erreur suppression ${user.email} : ${e.code}",);
        });
      }
    }
  }

  // ****************************************************************************
  // USERS
  Future<void> authenticateAndAddUser() async {
    for (var user in users) {
      String uid = "";
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: user.email, password: "123456789")
            .then((authResult) async {
            uid = authResult.user!.uid;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _description.insert(0, "L'utilisateur ${user.email} existe déjà");
          });
          // TODO : quand même récupéré l'id pour pouvoir quand même créé l'utilisateur
        }
      }
      final u = User(
          id: uid,
          username: user.username,
          email: user.email,
          profileImagePath: user.profileImagePath,
          nbPublications: user.nbPublications,
          nbAmis: user.nbAmis,
          hasMessage: user.hasMessage
      );

      final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

      await db.users.insert(u);
      setState(() {
        _description.insert(0, "Ajout de l'utilisateur${u.id}");
      });
    }
  }

  Future<void> addUsers() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    for (var user in users) {
      await db.users.insert(user);
      setState(() {
        _description.insert(0, "Ajout de l'utilisateur${user.id}");
      });
    }
  }

  // ****************************************************************************
  // INGREDIENTS
  Future<void> addIngredients() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    for (var ingredient in ingredients) {
      await db.ingredients.insert(ingredient);
      setState(() {
        _description.insert(0, "Ajout de l'ingrédient : ${ingredient.id}");
      });
    }
  }

  Future<void> addPermanentIngredients() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    Random random = Random();

    final users = await db.users.get();

    for (var user in users) {
      List<Ingredient> ingredients = await db.ingredients.get();
      Iterable<Ingredient> epiceIngredients = ingredients.where((element) => element.type == "Epice");

      int randomIndex = random.nextInt(epiceIngredients.length);
      final ingredientAdded = epiceIngredients.elementAt(randomIndex);

      Ingredient ingre = Ingredient(
          id: "permanentingredientfrom_${user.id}_${ingredientAdded.name.toLowerCase()}",
          name: ingredientAdded.name,
          type: ingredientAdded.type,
          quantity: ingredientAdded.quantity
      );

      await db.users(user.id).permanentIngredients.insert(ingre);

      setState(() {
        _description.insert(0, "Ajout de l'ingrédient permanent ${ingre.id} à l'utilisateur ${user.id}");
      });
    }
  }

  // ****************************************************************************
  // RECETTE
  Future<void> addRecipes() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    for (int i = 0; i < recipes.length; i++) {
      final recipe = recipes[i];

      await db.recipes.insert(recipe);

      final ingredientsList = ingredientsForRecipe[i];
      for (int j = 0; j < ingredientsList.length; j++) {
        await db.recipes(recipe.id).ingredients.insert(ingredientsList[j]);
        setState(() {
          _description.insert(0, "Ajout de l'ingrédient : ${ingredientsList[j].name} - à la recette : ${recipe.id}",);
        });
      }

      final users = await db.users.get();

      final int userIndex = i ~/ 2 % users.length;

      final user = users[userIndex];

      await db.recipes(recipe.id).owners.insert(user);
      if (recipe.isPosted) {
        await db.users(user.id).update(
            User(
              nbPublications: user.nbPublications + 1,
              hasMessage: user.hasMessage,
              nbAmis: user.nbAmis,
              username: user.username,
              email:  user.email,
              id: user.id,
              profileImagePath: user.profileImagePath
            )
        );
      }

      setState(() {
        _description.insert(0, "Ajout de la recette : ${recipe.titre} avec l'owner : ${user.id}",);
      });
    }
  }

  Future<void> addSavedRecipes() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    final users = await db.users.get();

    for (var user in users) {
      List<Recipe> recipes = await db.recipes.get();

      int i = 0;
      while (i < recipes.length) {
        final owner = await db.recipes(recipes[i].id).owners.get();

        if (owner.first.id != user.id) {
          await db.users(user.id).savedRecipes.insert(recipes[i]);

          setState(() {
            _description.insert(0, "Enregistrement de la recette ${recipes[i].id} par l'utilisateur ${user.id}");
          });

          i += 3;
        }
        else {
          i++;
        }
      }
    }
  }

  Future<void> addCommentToRecipe() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    final recipes = await db.recipes.get();
    final users = await db.users.get();

    final random = Random();

    for(final recipe in recipes){

      int commentCount = random.nextInt(4);

      for(int i=0; i<commentCount;i++){
        final user = users[random.nextInt(users.length)];
        final commentId = "comment_${recipe.id}_${i}";

        final comment = Comment(
          id: commentId,
          txt: CommentTxt[random.nextInt(CommentTxt.length)],
        );

        await db.recipes(recipe.id).comments.insert(comment);

        await db.recipes(recipe.id).comments(comment.id).users.insert(user);

        setState(() {
          _description.insert(0, "Ajout du commentaire ${comment.id} par ${user.username} sur ${recipe.id}",);
        });
      }
    }
  }

  Future<void> addMessage() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    final users = await db.users.get();

    final User AdaWong = users.firstWhere((a) => a.username == "AdaWong");
    final User KyleCrane = users.firstWhere((a) => a.username == "KyleCrane");
    final User MikaelaReid = users.firstWhere((a) => a.username == "MikaelaReid");

    final AdaWongId = AdaWong.id;
    final KyleCraneId = KyleCrane.id;
    final MikaelaReidId = MikaelaReid.id;

    await db.users(AdaWongId).friends.insert(KyleCrane);
    await db.users(AdaWongId).friends.insert(MikaelaReid);

    await db.users(KyleCraneId).friends.insert(AdaWong);
    await db.users(MikaelaReidId).friends.insert(AdaWong);

    await db.users(KyleCraneId).friends.insert(MikaelaReid);
    await db.users(MikaelaReidId).friends.insert(KyleCrane);


    await db.users(AdaWongId).friends(KyleCraneId).update(KyleCrane.copyWith(hasMessage: true));
    await db.users(AdaWongId).friends(MikaelaReidId).update(MikaelaReid.copyWith(hasMessage: true));

    await db.users(KyleCraneId).friends(AdaWongId).update(AdaWong.copyWith(hasMessage: true));
    await db.users(MikaelaReidId).friends(AdaWongId).update(AdaWong.copyWith(hasMessage: true));

    await db.users(KyleCraneId).friends(MikaelaReidId).update(MikaelaReid.copyWith(hasMessage: true));
    await db.users(MikaelaReidId).friends(KyleCraneId).update(KyleCrane.copyWith(hasMessage: true));

    for(int i=0; i < 5;i++) {
      await db.users(AdaWongId).friends(KyleCraneId).messages.insert(messagesAda_Kyle[i]);
      await db.users(KyleCraneId).friends(AdaWongId).messages.insert(messagesKyle_Ada[i]);

      await db.users(AdaWongId).friends(MikaelaReidId).messages.insert(messagesAda_Mikaela[i]);
      await db.users(MikaelaReidId).friends(AdaWongId).messages.insert(messagesMikaela_Ada[i]);

      await db.users(KyleCraneId).friends(MikaelaReidId).messages.insert(messagesKyle_Mikaela[i]);
      await db.users(MikaelaReidId).friends(KyleCraneId).messages.insert(messagesMikaela_Kyle[i]);

      setState(() {
        _description.insert(0, "Ajout de la ${i} ligne de message",);
      });
    }
  }
}