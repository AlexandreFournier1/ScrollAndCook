import 'package:dto/converter/firestore_timestamp_converter.dart';
import 'package:dto/model/comment.dart';
import 'package:dto/model/ingredient.dart';
import 'package:dto/model/message.dart';
import 'package:dto/model/recipe.dart';
import 'package:dto/model/user.dart';
import 'package:firestore_odm/firestore_odm.dart';

part 'schema.odm.dart';

@Schema()
@Collection<User>('users')
@Collection<User>('users/*/friends')
@Collection<Message>('users/*/friends/*/messages')
@Collection<Recipe>('users/*/saved_recipes')
@Collection<Ingredient>('users/*/permanent_ingredients')

@Collection<Recipe>('recipes')
@Collection<User>('recipes/*/owners')
@Collection<Ingredient>('recipes/*/ingredients')
@Collection<Comment>('recipes/*/comments')
@Collection<User>('recipes/*/comments/*/users')
@Collection<Ingredient>('ingredients')

@Collection<User>('recipes/*/like')

final appSchema = _$AppSchema;
