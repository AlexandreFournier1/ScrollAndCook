import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/padding.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/custom_title_screen.dart';
import 'package:scroll_and_cook/widgets/social_screen/custom_post_item.dart';

class MessagerieScreen extends StatefulWidget {
  MessagerieScreen({super.key,
  required String idFriend,
  }) : _idFriend = idFriend;

  late final String _idFriend;
  static const routeName = '/messagerie';

  @override
  State<MessagerieScreen> createState() => _MessagerieScreenState();
}

class _MessagerieScreenState extends State<MessagerieScreen> {
  late final TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(
      appSchema,
      firestore: FirebaseFirestore.instance
    );
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: db.users(widget._idFriend).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Erreur : ${snapshot.error}');
                }

                return Row(
                  children: [
                    WBackButton(),
                    CustomImage(size: kSizeFriendPDP, path: snapshot.data!.profileImagePath, assetOrNot: false,),
                    MyTitleScreen(title: snapshot.data!.username, color: kWhiteColor,)
                  ],
                );
              }
            ),
            Expanded(
              child: StreamBuilder(
                stream: db.users(currentUserId!).friends(widget._idFriend).messages.stream,

                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text("Erreur chargement des messages");
                  }

                  final messages = snapshot.data ?? [];

                  messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

                  return GroupedListView<Message, DateTime>(
                    padding: EdgeInsets.all(kNormalPadding),
                    elements: messages,
                    groupBy: (_) => DateTime(0),
                    groupHeaderBuilder: (Message message) => SizedBox(),
                    itemBuilder: (contect, Message message) {
                      Widget content = Text("Problème de Message");

                      if(message.type == "text"){
                        content = Text(message.text!);
                      }

                      if(message.type == "recipe"){
                        content = MyPostItem(
                          profilePicture: message.recipeOwnerImage!,
                          title: message.recipeTitle!,
                          image: message.recipeImage!,
                          idUtilisateur: message.recipeOwnerId!,
                          idRecette: message.recipeId!,
                          isOnProfile: true,
                          isOnPersonalProfile: false,
                        );
                      }
                      return Align(
                        alignment:
                        message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Padding(
                          padding: message.isSentByMe
                              ? EdgeInsets.only(left: kHugePadding)
                              : EdgeInsets.only(right: kHugePadding),
                          child: Card(
                            color: message.isSentByMe ? kSecondColor : kWhiteColor,
                            elevation: 8,
                            child: Padding(
                              padding: EdgeInsets.all(kNormalPadding),
                              child: content,
                            ),
                          ),
                        ),
                      );
                    }
                  );
                }
              )
            ),
            Container(
              color: kWhiteColor,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(kNormalPadding),
                        hintText: "Your message",
                      ),
                      onSubmitted: (text) async{
                        if(text.isNotEmpty) {
                          final message1 = Message(
                            text: messageController.text,
                            isSentByMe: true,
                            id: FirestoreODM.autoGeneratedId,
                            createdAt: DateTime.now(),
                            type: "text",
                          );
                          final message2 = Message(
                            text: messageController.text,
                            isSentByMe: false,
                            id: FirestoreODM.autoGeneratedId,
                            createdAt: DateTime.now(),
                            type: "text",
                          );

                          final currentUserId = FirebaseAuth.instance.currentUser?.uid;

                          await db.users(currentUserId!).friends(widget._idFriend).messages.insert(message1);

                          await db.users(widget._idFriend).friends(currentUserId!).messages.insert(message2);

                          messageController.clear();
                        }
                      },
                    ),
                  ),
                  SizedBox(width: kHorizontalPadding,),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () async{
                      if(messageController.text.isNotEmpty){

                        final message1 = Message(
                          text: messageController.text,
                          isSentByMe: true,
                          id: FirestoreODM.autoGeneratedId,
                          createdAt: DateTime.now(),
                          type: "text",
                        );
                        final message2 = Message(
                          text: messageController.text,
                          isSentByMe: false,
                          id: FirestoreODM.autoGeneratedId,
                          createdAt: DateTime.now(),
                          type: "text",
                        );

                        final currentUserId = FirebaseAuth.instance.currentUser?.uid;

                        await db.users(currentUserId!).friends(widget._idFriend).messages.insert(message1);

                        await db.users(widget._idFriend).friends(currentUserId!).messages.insert(message2);

                        messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
