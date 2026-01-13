// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: json['id'] as String,
  titre: json['titre'] as String,
  difficulty: (json['difficulty'] as num).toInt(),
  image: json['image'] as String,
  temps: (json['temps'] as num).toInt(),
  nbMinPersonne: (json['nbMinPersonne'] as num).toInt(),
  listEtape: (json['listEtape'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isPosted: json['isPosted'] as bool,
  nbLike: (json['nbLike'] as num).toInt(),
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'titre': instance.titre,
  'difficulty': instance.difficulty,
  'image': instance.image,
  'temps': instance.temps,
  'nbMinPersonne': instance.nbMinPersonne,
  'listEtape': instance.listEtape,
  'isPosted': instance.isPosted,
  'nbLike': instance.nbLike,
};
