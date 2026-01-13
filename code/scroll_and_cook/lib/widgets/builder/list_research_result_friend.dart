import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/vertical_list_view.dart';

class ListResearchResultFriend extends StatefulWidget {
  const ListResearchResultFriend({
    super.key,
    required String startWith
  }): _startWith = startWith;

  final String _startWith;

  @override
  State<ListResearchResultFriend> createState() => _ListResearchResultFriendState();
}

class _ListResearchResultFriendState extends State<ListResearchResultFriend> {
  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance
    );

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if(userId == null){
      return Text("Aucun utilisateur connecté");
    }

    return StreamBuilder(
        stream: db.users.stream,
        builder: (context,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
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
          return Text("Aucun Profil trouvé");
        }

        final filteredUser = users?.where((users) {
          return users.username.toLowerCase().contains(widget._startWith.toLowerCase());
        }).toList();

        final List<String> usernames = filteredUser!.map((u) => u.username).toList();
        final List<String> images = filteredUser!.map((u) => u.profileImagePath).toList();
        final List<String> idList = filteredUser!.map((u) => u.id).toList();
        final List<int> isMessagerie = [];

        if(usernames.isEmpty) {
          return Text("Aucun Username");
        }
        if(images.isEmpty) {
          return Text("Aucune Image");
        }
        if(idList.isEmpty) {
          return Text("Aucune Image");
        }

        for (int i = 0; i < usernames.length; i++){
          isMessagerie.add(1);
        }

        return VerticalListView(usernameList: usernames, imageList: images, idList: idList, isMessagerieList: isMessagerie,);
      }
    );
  }
}
