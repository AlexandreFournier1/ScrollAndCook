import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/recette_item_list_view.dart';

class RecetteListViewElement extends StatelessWidget {
  const RecetteListViewElement({
    super.key,
    required List<String> id,
    required List<String> title,
    required List<String> path,
    required List<int> starCount,
    required FirestoreODM<AppSchema> db

  }) : _title = title, _path = path, _starCount = starCount, _id = id, _db = db;

  final FirestoreODM<AppSchema> _db;
  final List<String> _id;
  final List<String> _title;
  final List<String> _path;
  final List<int> _starCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < _title.length; i++)
            RecetteItemListView(id: _id[i], title: _title[i], path: _path[i], starCount: _starCount[i], db: _db,)
        ],
      ),
    );
  }
}
