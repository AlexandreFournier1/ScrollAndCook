// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

@DocumentIdField() String get id; String get type;// text ou recipe
 String? get text; String? get recipeId; String? get recipeTitle; String? get recipeImage; String? get recipeOwnerId; String? get recipeOwnerImage; bool get isSentByMe;@FirestoreTimestampConverter() DateTime get createdAt;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.recipeTitle, recipeTitle) || other.recipeTitle == recipeTitle)&&(identical(other.recipeImage, recipeImage) || other.recipeImage == recipeImage)&&(identical(other.recipeOwnerId, recipeOwnerId) || other.recipeOwnerId == recipeOwnerId)&&(identical(other.recipeOwnerImage, recipeOwnerImage) || other.recipeOwnerImage == recipeOwnerImage)&&(identical(other.isSentByMe, isSentByMe) || other.isSentByMe == isSentByMe)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,text,recipeId,recipeTitle,recipeImage,recipeOwnerId,recipeOwnerImage,isSentByMe,createdAt);

@override
String toString() {
  return 'Message(id: $id, type: $type, text: $text, recipeId: $recipeId, recipeTitle: $recipeTitle, recipeImage: $recipeImage, recipeOwnerId: $recipeOwnerId, recipeOwnerImage: $recipeOwnerImage, isSentByMe: $isSentByMe, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
@DocumentIdField() String id, String type, String? text, String? recipeId, String? recipeTitle, String? recipeImage, String? recipeOwnerId, String? recipeOwnerImage, bool isSentByMe,@FirestoreTimestampConverter() DateTime createdAt
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? text = freezed,Object? recipeId = freezed,Object? recipeTitle = freezed,Object? recipeImage = freezed,Object? recipeOwnerId = freezed,Object? recipeOwnerImage = freezed,Object? isSentByMe = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,recipeTitle: freezed == recipeTitle ? _self.recipeTitle : recipeTitle // ignore: cast_nullable_to_non_nullable
as String?,recipeImage: freezed == recipeImage ? _self.recipeImage : recipeImage // ignore: cast_nullable_to_non_nullable
as String?,recipeOwnerId: freezed == recipeOwnerId ? _self.recipeOwnerId : recipeOwnerId // ignore: cast_nullable_to_non_nullable
as String?,recipeOwnerImage: freezed == recipeOwnerImage ? _self.recipeOwnerImage : recipeOwnerImage // ignore: cast_nullable_to_non_nullable
as String?,isSentByMe: null == isSentByMe ? _self.isSentByMe : isSentByMe // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DocumentIdField()  String id,  String type,  String? text,  String? recipeId,  String? recipeTitle,  String? recipeImage,  String? recipeOwnerId,  String? recipeOwnerImage,  bool isSentByMe, @FirestoreTimestampConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.type,_that.text,_that.recipeId,_that.recipeTitle,_that.recipeImage,_that.recipeOwnerId,_that.recipeOwnerImage,_that.isSentByMe,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DocumentIdField()  String id,  String type,  String? text,  String? recipeId,  String? recipeTitle,  String? recipeImage,  String? recipeOwnerId,  String? recipeOwnerImage,  bool isSentByMe, @FirestoreTimestampConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.type,_that.text,_that.recipeId,_that.recipeTitle,_that.recipeImage,_that.recipeOwnerId,_that.recipeOwnerImage,_that.isSentByMe,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DocumentIdField()  String id,  String type,  String? text,  String? recipeId,  String? recipeTitle,  String? recipeImage,  String? recipeOwnerId,  String? recipeOwnerImage,  bool isSentByMe, @FirestoreTimestampConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.type,_that.text,_that.recipeId,_that.recipeTitle,_that.recipeImage,_that.recipeOwnerId,_that.recipeOwnerImage,_that.isSentByMe,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({@DocumentIdField() required this.id, required this.type, this.text, this.recipeId, this.recipeTitle, this.recipeImage, this.recipeOwnerId, this.recipeOwnerImage, required this.isSentByMe, @FirestoreTimestampConverter() required this.createdAt});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override@DocumentIdField() final  String id;
@override final  String type;
// text ou recipe
@override final  String? text;
@override final  String? recipeId;
@override final  String? recipeTitle;
@override final  String? recipeImage;
@override final  String? recipeOwnerId;
@override final  String? recipeOwnerImage;
@override final  bool isSentByMe;
@override@FirestoreTimestampConverter() final  DateTime createdAt;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.recipeTitle, recipeTitle) || other.recipeTitle == recipeTitle)&&(identical(other.recipeImage, recipeImage) || other.recipeImage == recipeImage)&&(identical(other.recipeOwnerId, recipeOwnerId) || other.recipeOwnerId == recipeOwnerId)&&(identical(other.recipeOwnerImage, recipeOwnerImage) || other.recipeOwnerImage == recipeOwnerImage)&&(identical(other.isSentByMe, isSentByMe) || other.isSentByMe == isSentByMe)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,text,recipeId,recipeTitle,recipeImage,recipeOwnerId,recipeOwnerImage,isSentByMe,createdAt);

@override
String toString() {
  return 'Message(id: $id, type: $type, text: $text, recipeId: $recipeId, recipeTitle: $recipeTitle, recipeImage: $recipeImage, recipeOwnerId: $recipeOwnerId, recipeOwnerImage: $recipeOwnerImage, isSentByMe: $isSentByMe, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
@DocumentIdField() String id, String type, String? text, String? recipeId, String? recipeTitle, String? recipeImage, String? recipeOwnerId, String? recipeOwnerImage, bool isSentByMe,@FirestoreTimestampConverter() DateTime createdAt
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? text = freezed,Object? recipeId = freezed,Object? recipeTitle = freezed,Object? recipeImage = freezed,Object? recipeOwnerId = freezed,Object? recipeOwnerImage = freezed,Object? isSentByMe = null,Object? createdAt = null,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,recipeTitle: freezed == recipeTitle ? _self.recipeTitle : recipeTitle // ignore: cast_nullable_to_non_nullable
as String?,recipeImage: freezed == recipeImage ? _self.recipeImage : recipeImage // ignore: cast_nullable_to_non_nullable
as String?,recipeOwnerId: freezed == recipeOwnerId ? _self.recipeOwnerId : recipeOwnerId // ignore: cast_nullable_to_non_nullable
as String?,recipeOwnerImage: freezed == recipeOwnerImage ? _self.recipeOwnerImage : recipeOwnerImage // ignore: cast_nullable_to_non_nullable
as String?,isSentByMe: null == isSentByMe ? _self.isSentByMe : isSentByMe // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
