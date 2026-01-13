import 'package:flutter/material.dart';
import 'package:scroll_and_cook/styles/colors.dart';
import 'package:scroll_and_cook/styles/size.dart';
import 'package:scroll_and_cook/styles/spacings.dart';
import 'package:scroll_and_cook/widgets/builder/list_research_result_friend.dart';
import 'package:scroll_and_cook/widgets/button/back_button.dart';
import 'package:scroll_and_cook/widgets/custom_image.dart';
import 'package:scroll_and_cook/widgets/input/custom_research_input.dart';

class ResultResearchFriendScreen extends StatefulWidget {
  const ResultResearchFriendScreen ({super.key,
  String? textResearch
  }): _textResearch = textResearch;

  final String? _textResearch;
  static const routeName = '/resultResearchFriend';

  @override
  State<ResultResearchFriendScreen> createState() => _ResultResearchFriendScreenState();
}

class _ResultResearchFriendScreenState extends State<ResultResearchFriendScreen> {
  late final TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WBackButton(),
              CustomImage(
                size: kLogoSize,
                path: 'assets/icons/logo.png',
                assetOrNot: true,
              ),

              Padding(
                padding: EdgeInsets.only(left: kHorizontalPaddingFormInput, right: kHorizontalPaddingFormInput),
                child: CustomResearchTextInput(controller: inputController, label: 'Recherche', isRecipe: false),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.45, child: ListResearchResultFriend(startWith: inputController.text)),
            ],
          ),
        )
      ),
    );
  }
}
