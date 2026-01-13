import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/vertical_list_view.dart';

class ListConversation extends StatefulWidget {
  const ListConversation({
    super.key,
    required bool creation,
    required bool isEnvoyer,

    String? idRecipe,
    String? imageRecipe,
    String? ownerRecipe,
    String? titleRecipe,
    String? ownerRecipeImage
  }): _creation = creation, _isEnvoyer = isEnvoyer
  , _idRecipe = idRecipe, _imageRecipe = imageRecipe, _ownerRecipe = ownerRecipe, _titleRecipe = titleRecipe, _ownerRecipeImage = ownerRecipeImage;


  final bool _creation;
  final bool _isEnvoyer;

  final String? _idRecipe;
  final String? _imageRecipe;
  final String? _ownerRecipe;
  final String? _titleRecipe;
  final String? _ownerRecipeImage;

  @override
  State<ListConversation> createState() => _ListConversationState();
}

class _ListConversationState extends State<ListConversation> {

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Text("Aucun utilisateur connecté");
    }

    return StreamBuilder(
      // _convCree utiliser pour savoir si on veut
      // la liste de creation possible et si on veut la liste de conv
      // bool dans la bd (hasMessage)
        stream: db.users(userId).friends.stream,
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if(snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        }

        if(!snapshot.hasData){
          return Text("No data");
        }

        final users = snapshot.data ?? [];
        if(users.isEmpty) {
          if(widget._creation)
            return Text("Aucun Ami trouver");
          if(!widget._creation)
            return Text("Aucune conversation trouver");
        }

        List<String> usernames = [];
        List<String> images = [];
        List<String> idList = [];
        List<int> isMessagerie = [];

        if(widget._creation){
          final filtrer = users.where((a) => a.hasMessage == false);

          usernames = filtrer.map((u) => u.username).toList();
          images = filtrer.map((u) => u.profileImagePath).toList();
          idList = filtrer.map((u) => u.id).toList();
          isMessagerie = <int>[];

          if(usernames.isEmpty) {
            return Text("Aucun username trouver");
          }
          if(images.isEmpty) {
            return Text("Aucune image trouver");
          }
          if(idList.isEmpty) {
            return Text("Aucune Image");
          }

          for (int i = 0; i < usernames.length; i++){
            isMessagerie.add(3);
          }

          return VerticalListView(usernameList: usernames, imageList: images, idList: idList, isMessagerieList: isMessagerie,);
        }

        if(!widget._creation){
          final filtrer = users.where((a) => a.hasMessage == true);

          usernames = filtrer.map((u) => u.username).toList();
          images = filtrer.map((u) => u.profileImagePath).toList();
          idList = filtrer.map((u) => u.id).toList();
          isMessagerie = [];

          if(usernames.isEmpty) {
            return Text("Aucun Username");
          }
          if(images.isEmpty) {
            return Text("Aucune Image");
          }
          if(idList.isEmpty) {
            return Text("Aucune Image");
          }

          if(widget._isEnvoyer == true) {
            for (int i = 0; i < usernames.length; i++){
              isMessagerie.add(4);
            }
            return VerticalListView(usernameList: usernames, imageList: images, idList: idList, isMessagerieList: isMessagerie,
            idRecipe: widget._idRecipe, imageRecipe: widget._imageRecipe, ownerRecipe: widget._ownerRecipe, titleRecipe: widget._titleRecipe, ownerRecipeImage: widget._ownerRecipeImage,);
          }else{
            for (int i = 0; i < usernames.length; i++){
              isMessagerie.add(2);
            }
            return VerticalListView(usernameList: usernames, imageList: images, idList: idList, isMessagerieList: isMessagerie,);
          }
        }
        return Text("un problème est survenu");
      }
    );
  }
}
