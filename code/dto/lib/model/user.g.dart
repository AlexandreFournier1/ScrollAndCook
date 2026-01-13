// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  profileImagePath: json['profileImagePath'] as String,
  nbPublications: (json['nbPublications'] as num).toInt(),
  nbAmis: (json['nbAmis'] as num).toInt(),
  hasMessage: json['hasMessage'] as bool,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'profileImagePath': instance.profileImagePath,
  'nbPublications': instance.nbPublications,
  'nbAmis': instance.nbAmis,
  'hasMessage': instance.hasMessage,
};
