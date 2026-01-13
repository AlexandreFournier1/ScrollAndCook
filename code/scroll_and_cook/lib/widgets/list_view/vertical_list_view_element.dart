import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/vertical_item_list_view.dart';

class VerticalListViewElement extends StatelessWidget {
  const VerticalListViewElement({
    super.key,
    required List<String> usernameItem,
    required List<String> imageItem,
    required List<String> idItem,
    required List<int> isMessagerieItem,

    String? idRecipe,
    String? imageRecipe,
    String? ownerRecipe,
    String? titleRecipe,
    String? ownerRecipeImage

  }) :  _usernameItem = usernameItem, _imageItem = imageItem, _idItem = idItem, _isMessagerieItem = isMessagerieItem
  , _idRecipe = idRecipe, _imageRecipe = imageRecipe, _ownerRecipe = ownerRecipe, _titleRecipe = titleRecipe, _ownerRecipeImage = ownerRecipeImage;

  final List<String> _usernameItem;
  final List<String> _imageItem;
  final List<String> _idItem;
  final List<int> _isMessagerieItem;

  final String? _idRecipe;
  final String? _imageRecipe;
  final String? _ownerRecipe;
  final String? _titleRecipe;
  final String? _ownerRecipeImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < _usernameItem.length; i++) ... {
            if(_idRecipe == null)
              VerticalItemListView(path: _imageItem[i], username: _usernameItem[i], id: _idItem[i], isMessagerie: _isMessagerieItem[i],),
            if(_idRecipe != null)
              VerticalItemListView(path: _imageItem[i], username: _usernameItem[i], id: _idItem[i], isMessagerie: _isMessagerieItem[i],
              idRecipe: _idRecipe, imageRecipe: _imageRecipe, ownerRecipe: _ownerRecipe, titleRecipe: _titleRecipe, ownerRecipeImage: _ownerRecipeImage,),
          }
        ],
      ),
    );
  }
}
