// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {

@DocumentIdField() String get id; String get titre; int get difficulty; String get image; int get temps; int get nbMinPersonne; List<String> get listEtape; bool get isPosted; int get nbLike;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.image, image) || other.image == image)&&(identical(other.temps, temps) || other.temps == temps)&&(identical(other.nbMinPersonne, nbMinPersonne) || other.nbMinPersonne == nbMinPersonne)&&const DeepCollectionEquality().equals(other.listEtape, listEtape)&&(identical(other.isPosted, isPosted) || other.isPosted == isPosted)&&(identical(other.nbLike, nbLike) || other.nbLike == nbLike));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titre,difficulty,image,temps,nbMinPersonne,const DeepCollectionEquality().hash(listEtape),isPosted,nbLike);

@override
String toString() {
  return 'Recipe(id: $id, titre: $titre, difficulty: $difficulty, image: $image, temps: $temps, nbMinPersonne: $nbMinPersonne, listEtape: $listEtape, isPosted: $isPosted, nbLike: $nbLike)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
@DocumentIdField() String id, String titre, int difficulty, String image, int temps, int nbMinPersonne, List<String> listEtape, bool isPosted, int nbLike
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titre = null,Object? difficulty = null,Object? image = null,Object? temps = null,Object? nbMinPersonne = null,Object? listEtape = null,Object? isPosted = null,Object? nbLike = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,temps: null == temps ? _self.temps : temps // ignore: cast_nullable_to_non_nullable
as int,nbMinPersonne: null == nbMinPersonne ? _self.nbMinPersonne : nbMinPersonne // ignore: cast_nullable_to_non_nullable
as int,listEtape: null == listEtape ? _self.listEtape : listEtape // ignore: cast_nullable_to_non_nullable
as List<String>,isPosted: null == isPosted ? _self.isPosted : isPosted // ignore: cast_nullable_to_non_nullable
as bool,nbLike: null == nbLike ? _self.nbLike : nbLike // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DocumentIdField()  String id,  String titre,  int difficulty,  String image,  int temps,  int nbMinPersonne,  List<String> listEtape,  bool isPosted,  int nbLike)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.titre,_that.difficulty,_that.image,_that.temps,_that.nbMinPersonne,_that.listEtape,_that.isPosted,_that.nbLike);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DocumentIdField()  String id,  String titre,  int difficulty,  String image,  int temps,  int nbMinPersonne,  List<String> listEtape,  bool isPosted,  int nbLike)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
return $default(_that.id,_that.titre,_that.difficulty,_that.image,_that.temps,_that.nbMinPersonne,_that.listEtape,_that.isPosted,_that.nbLike);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DocumentIdField()  String id,  String titre,  int difficulty,  String image,  int temps,  int nbMinPersonne,  List<String> listEtape,  bool isPosted,  int nbLike)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.titre,_that.difficulty,_that.image,_that.temps,_that.nbMinPersonne,_that.listEtape,_that.isPosted,_that.nbLike);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({@DocumentIdField() required this.id, required this.titre, required this.difficulty, required this.image, required this.temps, required this.nbMinPersonne, required final  List<String> listEtape, required this.isPosted, required this.nbLike}): _listEtape = listEtape;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override@DocumentIdField() final  String id;
@override final  String titre;
@override final  int difficulty;
@override final  String image;
@override final  int temps;
@override final  int nbMinPersonne;
 final  List<String> _listEtape;
@override List<String> get listEtape {
  if (_listEtape is EqualUnmodifiableListView) return _listEtape;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listEtape);
}

@override final  bool isPosted;
@override final  int nbLike;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.image, image) || other.image == image)&&(identical(other.temps, temps) || other.temps == temps)&&(identical(other.nbMinPersonne, nbMinPersonne) || other.nbMinPersonne == nbMinPersonne)&&const DeepCollectionEquality().equals(other._listEtape, _listEtape)&&(identical(other.isPosted, isPosted) || other.isPosted == isPosted)&&(identical(other.nbLike, nbLike) || other.nbLike == nbLike));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titre,difficulty,image,temps,nbMinPersonne,const DeepCollectionEquality().hash(_listEtape),isPosted,nbLike);

@override
String toString() {
  return 'Recipe(id: $id, titre: $titre, difficulty: $difficulty, image: $image, temps: $temps, nbMinPersonne: $nbMinPersonne, listEtape: $listEtape, isPosted: $isPosted, nbLike: $nbLike)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
@DocumentIdField() String id, String titre, int difficulty, String image, int temps, int nbMinPersonne, List<String> listEtape, bool isPosted, int nbLike
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titre = null,Object? difficulty = null,Object? image = null,Object? temps = null,Object? nbMinPersonne = null,Object? listEtape = null,Object? isPosted = null,Object? nbLike = null,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,temps: null == temps ? _self.temps : temps // ignore: cast_nullable_to_non_nullable
as int,nbMinPersonne: null == nbMinPersonne ? _self.nbMinPersonne : nbMinPersonne // ignore: cast_nullable_to_non_nullable
as int,listEtape: null == listEtape ? _self._listEtape : listEtape // ignore: cast_nullable_to_non_nullable
as List<String>,isPosted: null == isPosted ? _self.isPosted : isPosted // ignore: cast_nullable_to_non_nullable
as bool,nbLike: null == nbLike ? _self.nbLike : nbLike // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
