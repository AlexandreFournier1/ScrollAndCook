// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  type: json['type'] as String,
  text: json['text'] as String?,
  recipeId: json['recipeId'] as String?,
  recipeTitle: json['recipeTitle'] as String?,
  recipeImage: json['recipeImage'] as String?,
  recipeOwnerId: json['recipeOwnerId'] as String?,
  recipeOwnerImage: json['recipeOwnerImage'] as String?,
  isSentByMe: json['isSentByMe'] as bool,
  createdAt: const FirestoreTimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'text': instance.text,
  'recipeId': instance.recipeId,
  'recipeTitle': instance.recipeTitle,
  'recipeImage': instance.recipeImage,
  'recipeOwnerId': instance.recipeOwnerId,
  'recipeOwnerImage': instance.recipeOwnerImage,
  'isSentByMe': instance.isSentByMe,
  'createdAt': const FirestoreTimestampConverter().toJson(instance.createdAt),
};
