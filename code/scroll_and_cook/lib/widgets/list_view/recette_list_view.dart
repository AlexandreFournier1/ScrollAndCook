import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:scroll_and_cook/widgets/list_view/recette_list_view_element.dart';

class RecetteListView extends StatelessWidget {
  const RecetteListView({
    super.key,
    required List<String> id,
    required List<String> title,
    required List<String> path,
    required List<int> starCount,
    required FirestoreODM<AppSchema> db,
  }) : _title = title, _path = path, _starCount = starCount, _id = id, _db = db;

  final FirestoreODM<AppSchema> _db;
  final List<String> _id;
  final List<String> _title;
  final List<String> _path;
  final List<int> _starCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          RecetteListViewElement(id: _id, title: _title, path: _path, starCount: _starCount, db: _db,)
        ],
      ),
    );
  }
}
