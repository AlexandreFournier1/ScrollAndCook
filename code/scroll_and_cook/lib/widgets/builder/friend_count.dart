import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FriendCount extends StatefulWidget {
  const FriendCount({
    super.key,
    required String? userId,
  }): _userId = userId;

  final String? _userId ;

  @override
  State<FriendCount> createState() => _FriendCountState();
}

class _FriendCountState extends State<FriendCount> {
  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance,
    );

    final userId = widget._userId ?? FirebaseAuth.instance.currentUser?.uid;

    if(userId == null) {
      return Text("Aucun utilisateur connecté");
    }

    return StreamBuilder(
      stream: db.users(userId).friends.stream,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }

        if(snapshot.hasError){
          return Text('Erreur : ${snapshot.error}');
        }

        if(!snapshot.hasData){
          return Text("No data");
        }
        final friends = snapshot.data ?? [];

        if(friends.isEmpty){
          return Text("0");
        }

        return Text(friends.length.toString());
      }
    );
  }
}
