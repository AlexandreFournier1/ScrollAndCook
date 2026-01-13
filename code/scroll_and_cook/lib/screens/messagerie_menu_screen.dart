import 'package:flutter/material.dart';
import 'package:scroll_and_cook/screens/result_research_friend_screen.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/texts.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/button/custom_elevated_button.dart';
import 'package:scroll_and_cook/widgets/custom_title_screen.dart';
import 'package:scroll_and_cook/widgets/icon/custom_icon_box.dart';
import 'package:scroll_and_cook/widgets/builder/list_conversation.dart';

class MessagerieMenuScreen extends StatefulWidget {
  const MessagerieMenuScreen({super.key});

  static const routeName = '/messagerieMenu';

  @override
  State<MessagerieMenuScreen> createState() => _MessagerieMenuScreenState();
}

class _MessagerieMenuScreenState extends State<MessagerieMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  WBackButton(),
                  MyTitleScreen(title: "Vos Amis", color: kWhiteColor),
                  MyIconBox(
                    list: [Icons.search,],
                    size: kIconSize,
                    onTap: [
                      () {Navigator.pushNamed(context, ResultResearchFriendScreen.routeName);},
                    ],
                  ),
                  SizedBox(width: kHalfHalfHeightBetweenElement,),
                  MyCustomElevatedButton(
                    color: kSecondColor,
                    size: 75,
                    isIcon: true,
                    icon: Icons.add,
                    elementBox: [
                      SizedBox(height: kHalfHeightBetweenElement,),
                      Text('Créer une conversation',
                          style: kMainTextCreateRecette
                      ),
                      SizedBox(height: kHalfHeightBetweenElement,),
                      SizedBox(
                          height: MediaQuery.of(context).size.height*0.5,
                          child: ListConversation(creation: true, isEnvoyer: false,)
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: kHeightBetweenElement,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.8,
                child: ListConversation(creation: false, isEnvoyer: false,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
