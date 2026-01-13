import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/vertical_list_view_element.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    super.key,
    required List<String> usernameList,
    required List<String> imageList,
    required List<String> idList,
    required List<int> isMessagerieList,

    String? idRecipe,
    String? imageRecipe,
    String? ownerRecipe,
    String? titleRecipe,
    String? ownerRecipeImage

  }) : _usernameList = usernameList,  _imageList = imageList, _idList = idList, _isMessagerieList = isMessagerieList
  , _idRecipe = idRecipe, _imageRecipe = imageRecipe, _ownerRecipe = ownerRecipe, _titleRecipe = titleRecipe, _ownerRecipeImage = ownerRecipeImage;

  final List<String> _usernameList;
  final List<String> _imageList;
  final List<String> _idList;
  final List<int> _isMessagerieList;

  final String? _idRecipe;
  final String? _imageRecipe;
  final String? _ownerRecipe;
  final String? _titleRecipe;
  final String? _ownerRecipeImage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        if(_idRecipe == null) ... {
          VerticalListViewElement(
            usernameItem: _usernameList,
            imageItem: _imageList,
            idItem: _idList,
            isMessagerieItem: _isMessagerieList,
          ),
        },
        if(_idRecipe != null) ... {
          VerticalListViewElement(
            usernameItem: _usernameList,
            imageItem: _imageList,
            idItem: _idList,
            isMessagerieItem: _isMessagerieList,
            idRecipe: _idRecipe,
            imageRecipe: _imageRecipe,
            ownerRecipe: _ownerRecipe,
            titleRecipe: _titleRecipe,
            ownerRecipeImage: _ownerRecipeImage,
          ),
        }
      ],
    );
  }
}
