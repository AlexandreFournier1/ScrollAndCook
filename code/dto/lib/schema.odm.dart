// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// FirestoreGenerator
// **************************************************************************

/// Identifiers for all Firestore collections in the schema
/// Used to map collection paths to their respective collection classes
/// By combining collection classes (e.g., as tuple types),
/// we can use extension methods with record types to reduce boilerplate
/// Example: (_$UsersCollection, _$PostsCollection)
final class _$UsersCollection {}

final class _$FriendsCollection {}

final class _$MessagesCollection {}

final class _$Saved_recipesCollection {}

final class _$Permanent_ingredientsCollection {}

final class _$RecipesCollection {}

final class _$OwnersCollection {}

final class _$IngredientsCollection {}

final class _$CommentsCollection {}

final class _$LikeCollection {}

/// Generated schema class - dummy class that only serves as type marker
class AppSchema extends FirestoreSchema {
  const AppSchema();
}

/// Generated schema instance
const AppSchema _$AppSchema = AppSchema();

/// Generated FilterSelector for `User`
extension AppSchemaUserFilterSelectorExtension on FilterSelector<User> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by username
  StringFieldFilter get username =>
      StringFieldFilter(name: 'username', parent: this);

  /// Filter by email
  StringFieldFilter get email => StringFieldFilter(name: 'email', parent: this);

  /// Filter by profileImagePath
  StringFieldFilter get profileImagePath =>
      StringFieldFilter(name: 'profileImagePath', parent: this);

  /// Filter by nbPublications
  NumericFieldFilter get nbPublications =>
      NumericFieldFilter(name: 'nbPublications', parent: this);

  /// Filter by nbAmis
  NumericFieldFilter get nbAmis =>
      NumericFieldFilter(name: 'nbAmis', parent: this);

  /// Filter by hasMessage
  BoolFieldFilter get hasMessage =>
      BoolFieldFilter(name: 'hasMessage', parent: this);
}

/// Generated OrderByFieldSelector for `User`
extension AppSchemaUserOrderByFieldSelectorExtension
    on OrderByFieldSelector<User> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by username
  OrderByField<String> get username =>
      OrderByField(name: 'username', parent: this);

  /// Order by email
  OrderByField<String> get email => OrderByField(name: 'email', parent: this);

  /// Order by profileImagePath
  OrderByField<String> get profileImagePath =>
      OrderByField(name: 'profileImagePath', parent: this);

  /// Order by nbPublications
  OrderByField<int> get nbPublications =>
      OrderByField(name: 'nbPublications', parent: this);

  /// Order by nbAmis
  OrderByField<int> get nbAmis => OrderByField(name: 'nbAmis', parent: this);

  /// Order by hasMessage
  OrderByField<bool> get hasMessage =>
      OrderByField(name: 'hasMessage', parent: this);
}

/// Generated AggregateFieldSelector for User
extension AppSchemaUserAggregateFieldSelectorExtension
    on AggregateFieldSelector<User> {
  /// nbPublications field for aggregation
  AggregateField<int> get nbPublications =>
      AggregateField(name: 'nbPublications', parent: this);

  /// nbAmis field for aggregation
  AggregateField<int> get nbAmis =>
      AggregateField(name: 'nbAmis', parent: this);
}

extension AppSchemaUserPatchBuilder on PatchBuilder<User> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update username field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get username => PatchBuilder(
    name: 'username',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update email field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get email => PatchBuilder(
    name: 'email',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update profileImagePath field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get profileImagePath => PatchBuilder(
    name: 'profileImagePath',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update nbPublications field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get nbPublications => NumericFieldUpdate(
    name: 'nbPublications',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update nbAmis field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get nbAmis => NumericFieldUpdate(
    name: 'nbAmis',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update hasMessage field `bool`
  @pragma('vm:prefer-inline')
  PatchBuilder<bool> get hasMessage => PatchBuilder(
    name: 'hasMessage',
    parent: this,
    converter: const PrimitiveConverter(),
  );
}

/// Generated FilterSelector for `Message`
extension AppSchemaMessageFilterSelectorExtension on FilterSelector<Message> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by type
  StringFieldFilter get type => StringFieldFilter(name: 'type', parent: this);

  /// Filter by text
  StringFieldFilter get text => StringFieldFilter(name: 'text', parent: this);

  /// Filter by recipeId
  StringFieldFilter get recipeId =>
      StringFieldFilter(name: 'recipeId', parent: this);

  /// Filter by recipeTitle
  StringFieldFilter get recipeTitle =>
      StringFieldFilter(name: 'recipeTitle', parent: this);

  /// Filter by recipeImage
  StringFieldFilter get recipeImage =>
      StringFieldFilter(name: 'recipeImage', parent: this);

  /// Filter by recipeOwnerId
  StringFieldFilter get recipeOwnerId =>
      StringFieldFilter(name: 'recipeOwnerId', parent: this);

  /// Filter by recipeOwnerImage
  StringFieldFilter get recipeOwnerImage =>
      StringFieldFilter(name: 'recipeOwnerImage', parent: this);

  /// Filter by isSentByMe
  BoolFieldFilter get isSentByMe =>
      BoolFieldFilter(name: 'isSentByMe', parent: this);

  /// Filter by createdAt
  DateTimeFieldFilter get createdAt =>
      DateTimeFieldFilter(name: 'createdAt', parent: this);
}

/// Generated OrderByFieldSelector for `Message`
extension AppSchemaMessageOrderByFieldSelectorExtension
    on OrderByFieldSelector<Message> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by type
  OrderByField<String> get type => OrderByField(name: 'type', parent: this);

  /// Order by text
  OrderByField<String?> get text => OrderByField(name: 'text', parent: this);

  /// Order by recipeId
  OrderByField<String?> get recipeId =>
      OrderByField(name: 'recipeId', parent: this);

  /// Order by recipeTitle
  OrderByField<String?> get recipeTitle =>
      OrderByField(name: 'recipeTitle', parent: this);

  /// Order by recipeImage
  OrderByField<String?> get recipeImage =>
      OrderByField(name: 'recipeImage', parent: this);

  /// Order by recipeOwnerId
  OrderByField<String?> get recipeOwnerId =>
      OrderByField(name: 'recipeOwnerId', parent: this);

  /// Order by recipeOwnerImage
  OrderByField<String?> get recipeOwnerImage =>
      OrderByField(name: 'recipeOwnerImage', parent: this);

  /// Order by isSentByMe
  OrderByField<bool> get isSentByMe =>
      OrderByField(name: 'isSentByMe', parent: this);

  /// Order by createdAt
  OrderByField<DateTime> get createdAt =>
      OrderByField(name: 'createdAt', parent: this);
}

/// Generated AggregateFieldSelector for Message
extension AppSchemaMessageAggregateFieldSelectorExtension
    on AggregateFieldSelector<Message> {}

extension AppSchemaMessagePatchBuilder on PatchBuilder<Message> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update type field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get type => PatchBuilder(
    name: 'type',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update text field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get text => PatchBuilder(
    name: 'text',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update recipeId field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get recipeId => PatchBuilder(
    name: 'recipeId',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update recipeTitle field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get recipeTitle => PatchBuilder(
    name: 'recipeTitle',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update recipeImage field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get recipeImage => PatchBuilder(
    name: 'recipeImage',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update recipeOwnerId field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get recipeOwnerId => PatchBuilder(
    name: 'recipeOwnerId',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update recipeOwnerImage field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get recipeOwnerImage => PatchBuilder(
    name: 'recipeOwnerImage',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update isSentByMe field `bool`
  @pragma('vm:prefer-inline')
  PatchBuilder<bool> get isSentByMe => PatchBuilder(
    name: 'isSentByMe',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update createdAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get createdAt =>
      DateTimeFieldUpdate(name: 'createdAt', parent: this);
}

/// Generated FilterSelector for `Recipe`
extension AppSchemaRecipeFilterSelectorExtension on FilterSelector<Recipe> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by titre
  StringFieldFilter get titre => StringFieldFilter(name: 'titre', parent: this);

  /// Filter by difficulty
  NumericFieldFilter get difficulty =>
      NumericFieldFilter(name: 'difficulty', parent: this);

  /// Filter by image
  StringFieldFilter get image => StringFieldFilter(name: 'image', parent: this);

  /// Filter by temps
  NumericFieldFilter get temps =>
      NumericFieldFilter(name: 'temps', parent: this);

  /// Filter by nbMinPersonne
  NumericFieldFilter get nbMinPersonne =>
      NumericFieldFilter(name: 'nbMinPersonne', parent: this);

  /// Filter by listEtape
  ArrayFieldFilter get listEtape =>
      ArrayFieldFilter(name: 'listEtape', parent: this);

  /// Filter by isPosted
  BoolFieldFilter get isPosted =>
      BoolFieldFilter(name: 'isPosted', parent: this);

  /// Filter by nbLike
  NumericFieldFilter get nbLike =>
      NumericFieldFilter(name: 'nbLike', parent: this);
}

/// Generated OrderByFieldSelector for `Recipe`
extension AppSchemaRecipeOrderByFieldSelectorExtension
    on OrderByFieldSelector<Recipe> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by titre
  OrderByField<String> get titre => OrderByField(name: 'titre', parent: this);

  /// Order by difficulty
  OrderByField<int> get difficulty =>
      OrderByField(name: 'difficulty', parent: this);

  /// Order by image
  OrderByField<String> get image => OrderByField(name: 'image', parent: this);

  /// Order by temps
  OrderByField<int> get temps => OrderByField(name: 'temps', parent: this);

  /// Order by nbMinPersonne
  OrderByField<int> get nbMinPersonne =>
      OrderByField(name: 'nbMinPersonne', parent: this);

  /// Order by listEtape
  OrderByField<List<String>> get listEtape =>
      OrderByField(name: 'listEtape', parent: this);

  /// Order by isPosted
  OrderByField<bool> get isPosted =>
      OrderByField(name: 'isPosted', parent: this);

  /// Order by nbLike
  OrderByField<int> get nbLike => OrderByField(name: 'nbLike', parent: this);
}

/// Generated AggregateFieldSelector for Recipe
extension AppSchemaRecipeAggregateFieldSelectorExtension
    on AggregateFieldSelector<Recipe> {
  /// difficulty field for aggregation
  AggregateField<int> get difficulty =>
      AggregateField(name: 'difficulty', parent: this);

  /// temps field for aggregation
  AggregateField<int> get temps => AggregateField(name: 'temps', parent: this);

  /// nbMinPersonne field for aggregation
  AggregateField<int> get nbMinPersonne =>
      AggregateField(name: 'nbMinPersonne', parent: this);

  /// nbLike field for aggregation
  AggregateField<int> get nbLike =>
      AggregateField(name: 'nbLike', parent: this);
}

extension AppSchemaRecipePatchBuilder on PatchBuilder<Recipe> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update titre field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get titre => PatchBuilder(
    name: 'titre',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update difficulty field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get difficulty => NumericFieldUpdate(
    name: 'difficulty',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update image field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get image => PatchBuilder(
    name: 'image',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update temps field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get temps => NumericFieldUpdate(
    name: 'temps',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update nbMinPersonne field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get nbMinPersonne => NumericFieldUpdate(
    name: 'nbMinPersonne',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update listEtape field `List<String>`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<String>, String> get listEtape => ListFieldUpdate(
    name: 'listEtape',
    parent: this,
    converter: /* {} */ ListConverter<String>(const PrimitiveConverter()),
    elementConverter: const PrimitiveConverter(),
  );

  /// Update isPosted field `bool`
  @pragma('vm:prefer-inline')
  PatchBuilder<bool> get isPosted => PatchBuilder(
    name: 'isPosted',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update nbLike field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get nbLike => NumericFieldUpdate(
    name: 'nbLike',
    parent: this,
    converter: const PrimitiveConverter(),
  );
}

/// Generated FilterSelector for `List<E>`
extension AppSchemaListFilterSelectorExtension<E> on FilterSelector<List<E>> {}

/// Generated OrderByFieldSelector for `List<E>`
extension AppSchemaListOrderByFieldSelectorExtension<E>
    on OrderByFieldSelector<List<E>> {}

/// Generated FilterSelector for `Ingredient`
extension AppSchemaIngredientFilterSelectorExtension
    on FilterSelector<Ingredient> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by name
  StringFieldFilter get name => StringFieldFilter(name: 'name', parent: this);

  /// Filter by type
  StringFieldFilter get type => StringFieldFilter(name: 'type', parent: this);

  /// Filter by quantity
  StringFieldFilter get quantity =>
      StringFieldFilter(name: 'quantity', parent: this);
}

/// Generated OrderByFieldSelector for `Ingredient`
extension AppSchemaIngredientOrderByFieldSelectorExtension
    on OrderByFieldSelector<Ingredient> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by name
  OrderByField<String> get name => OrderByField(name: 'name', parent: this);

  /// Order by type
  OrderByField<String> get type => OrderByField(name: 'type', parent: this);

  /// Order by quantity
  OrderByField<String> get quantity =>
      OrderByField(name: 'quantity', parent: this);
}

/// Generated AggregateFieldSelector for Ingredient
extension AppSchemaIngredientAggregateFieldSelectorExtension
    on AggregateFieldSelector<Ingredient> {}

extension AppSchemaIngredientPatchBuilder on PatchBuilder<Ingredient> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update name field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get name => PatchBuilder(
    name: 'name',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update type field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get type => PatchBuilder(
    name: 'type',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update quantity field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get quantity => PatchBuilder(
    name: 'quantity',
    parent: this,
    converter: const PrimitiveConverter(),
  );
}

/// Generated FilterSelector for `Comment`
extension AppSchemaCommentFilterSelectorExtension on FilterSelector<Comment> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by txt
  StringFieldFilter get txt => StringFieldFilter(name: 'txt', parent: this);
}

/// Generated OrderByFieldSelector for `Comment`
extension AppSchemaCommentOrderByFieldSelectorExtension
    on OrderByFieldSelector<Comment> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by txt
  OrderByField<String> get txt => OrderByField(name: 'txt', parent: this);
}

/// Generated AggregateFieldSelector for Comment
extension AppSchemaCommentAggregateFieldSelectorExtension
    on AggregateFieldSelector<Comment> {}

extension AppSchemaCommentPatchBuilder on PatchBuilder<Comment> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update txt field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get txt => PatchBuilder(
    name: 'txt',
    parent: this,
    converter: const PrimitiveConverter(),
  );
}

/// Class to add collections to `FirestoreODM<AppSchema>`
extension AppSchemaODM on FirestoreODM<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      FirestoreCollection<AppSchema, User, (_$UsersCollection,)>(
        query: firestore.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );

  /// Access recipes collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<AppSchema, Recipe, (_$RecipesCollection,)> get recipes =>
      FirestoreCollection<AppSchema, Recipe, (_$RecipesCollection,)>(
        query: firestore.collection('recipes'),
        converter: const _$RecipeJsonConverter(),
        documentIdField: 'id',
      );

  /// Access ingredients collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<AppSchema, Ingredient, (_$IngredientsCollection,)>
  get ingredients =>
      FirestoreCollection<AppSchema, Ingredient, (_$IngredientsCollection,)>(
        query: firestore.collection('ingredients'),
        converter: const _$IngredientJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to `TransactionContext<AppSchema>`
extension $AppSchemaTransactionContext on TransactionContext<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      TransactionCollection<AppSchema, User, (_$UsersCollection,)>(
        query: ref.collection('users'),
        context: this,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );

  /// Access recipes collection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, Recipe, (_$RecipesCollection,)>
  get recipes =>
      TransactionCollection<AppSchema, Recipe, (_$RecipesCollection,)>(
        query: ref.collection('recipes'),
        context: this,
        converter: const _$RecipeJsonConverter(),
        documentIdField: 'id',
      );

  /// Access ingredients collection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, Ingredient, (_$IngredientsCollection,)>
  get ingredients =>
      TransactionCollection<AppSchema, Ingredient, (_$IngredientsCollection,)>(
        query: ref.collection('ingredients'),
        context: this,
        converter: const _$IngredientJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for users collection
extension $AppSchemaUsersTransactionDocument
    on TransactionDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access friends subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    User,
    (_$UsersCollection, _$FriendsCollection)
  >
  get friends =>
      TransactionCollection<
        AppSchema,
        User,
        (_$UsersCollection, _$FriendsCollection)
      >(
        query: ref.collection('friends'),
        context: context,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );

  /// Access saved_recipes subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Recipe,
    (_$UsersCollection, _$Saved_recipesCollection)
  >
  get savedRecipes =>
      TransactionCollection<
        AppSchema,
        Recipe,
        (_$UsersCollection, _$Saved_recipesCollection)
      >(
        query: ref.collection('saved_recipes'),
        context: context,
        converter: const _$RecipeJsonConverter(),
        documentIdField: 'id',
      );

  /// Access permanent_ingredients subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Ingredient,
    (_$UsersCollection, _$Permanent_ingredientsCollection)
  >
  get permanentIngredients =>
      TransactionCollection<
        AppSchema,
        Ingredient,
        (_$UsersCollection, _$Permanent_ingredientsCollection)
      >(
        query: ref.collection('permanent_ingredients'),
        context: context,
        converter: const _$IngredientJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for users/*/friends collection
extension $AppSchemaUsersFriendsTransactionDocument
    on
        TransactionDocument<
          AppSchema,
          User,
          (_$UsersCollection, _$FriendsCollection)
        > {
  /// Access messages subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Message,
    (_$UsersCollection, _$FriendsCollection, _$MessagesCollection)
  >
  get messages =>
      TransactionCollection<
        AppSchema,
        Message,
        (_$UsersCollection, _$FriendsCollection, _$MessagesCollection)
      >(
        query: ref.collection('messages'),
        context: context,
        converter: const _$MessageJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for recipes collection
extension $AppSchemaRecipesTransactionDocument
    on TransactionDocument<AppSchema, Recipe, (_$RecipesCollection,)> {
  /// Access owners subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    User,
    (_$RecipesCollection, _$OwnersCollection)
  >
  get owners =>
      TransactionCollection<
        AppSchema,
        User,
        (_$RecipesCollection, _$OwnersCollection)
      >(
        query: ref.collection('owners'),
        context: context,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );

  /// Access ingredients subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Ingredient,
    (_$RecipesCollection, _$IngredientsCollection)
  >
  get ingredients =>
      TransactionCollection<
        AppSchema,
        Ingredient,
        (_$RecipesCollection, _$IngredientsCollection)
      >(
        query: ref.collection('ingredients'),
        context: context,
        converter: const _$IngredientJsonConverter(),
        documentIdField: 'id',
      );

  /// Access comments subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Comment,
    (_$RecipesCollection, _$CommentsCollection)
  >
  get comments =>
      TransactionCollection<
        AppSchema,
        Comment,
        (_$RecipesCollection, _$CommentsCollection)
      >(
        query: ref.collection('comments'),
        context: context,
        converter: const _$CommentJsonConverter(),
        documentIdField: 'id',
      );

  /// Access like subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    User,
    (_$RecipesCollection, _$LikeCollection)
  >
  get like =>
      TransactionCollection<
        AppSchema,
        User,
        (_$RecipesCollection, _$LikeCollection)
      >(
        query: ref.collection('like'),
        context: context,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for recipes/*/comments collection
extension $AppSchemaRecipesCommentsTransactionDocument
    on
        TransactionDocument<
          AppSchema,
          Comment,
          (_$RecipesCollection, _$CommentsCollection)
        > {
  /// Access users subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    User,
    (_$RecipesCollection, _$CommentsCollection, _$UsersCollection)
  >
  get users =>
      TransactionCollection<
        AppSchema,
        User,
        (_$RecipesCollection, _$CommentsCollection, _$UsersCollection)
      >(
        query: ref.collection('users'),
        context: context,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for users collection
extension $AppSchemaUsersDocument
    on FirestoreDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access friends subcollection
  FirestoreCollection<AppSchema, User, (_$UsersCollection, _$FriendsCollection)>
  get friends =>
      FirestoreCollection<
        AppSchema,
        User,
        (_$UsersCollection, _$FriendsCollection)
      >(
        query: ref.collection('friends'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );

  /// Access saved_recipes subcollection
  FirestoreCollection<
    AppSchema,
    Recipe,
    (_$UsersCollection, _$Saved_recipesCollection)
  >
  get savedRecipes =>
      FirestoreCollection<
        AppSchema,
        Recipe,
        (_$UsersCollection, _$Saved_recipesCollection)
      >(
        query: ref.collection('saved_recipes'),
        converter: const _$RecipeJsonConverter(),
        documentIdField: 'id',
      );

  /// Access permanent_ingredients subcollection
  FirestoreCollection<
    AppSchema,
    Ingredient,
    (_$UsersCollection, _$Permanent_ingredientsCollection)
  >
  get permanentIngredients =>
      FirestoreCollection<
        AppSchema,
        Ingredient,
        (_$UsersCollection, _$Permanent_ingredientsCollection)
      >(
        query: ref.collection('permanent_ingredients'),
        converter: const _$IngredientJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for users/*/friends collection
extension $AppSchemaUsersFriendsDocument
    on
        FirestoreDocument<
          AppSchema,
          User,
          (_$UsersCollection, _$FriendsCollection)
        > {
  /// Access messages subcollection
  FirestoreCollection<
    AppSchema,
    Message,
    (_$UsersCollection, _$FriendsCollection, _$MessagesCollection)
  >
  get messages =>
      FirestoreCollection<
        AppSchema,
        Message,
        (_$UsersCollection, _$FriendsCollection, _$MessagesCollection)
      >(
        query: ref.collection('messages'),
        converter: const _$MessageJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for recipes collection
extension $AppSchemaRecipesDocument
    on FirestoreDocument<AppSchema, Recipe, (_$RecipesCollection,)> {
  /// Access owners subcollection
  FirestoreCollection<
    AppSchema,
    User,
    (_$RecipesCollection, _$OwnersCollection)
  >
  get owners =>
      FirestoreCollection<
        AppSchema,
        User,
        (_$RecipesCollection, _$OwnersCollection)
      >(
        query: ref.collection('owners'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );

  /// Access ingredients subcollection
  FirestoreCollection<
    AppSchema,
    Ingredient,
    (_$RecipesCollection, _$IngredientsCollection)
  >
  get ingredients =>
      FirestoreCollection<
        AppSchema,
        Ingredient,
        (_$RecipesCollection, _$IngredientsCollection)
      >(
        query: ref.collection('ingredients'),
        converter: const _$IngredientJsonConverter(),
        documentIdField: 'id',
      );

  /// Access comments subcollection
  FirestoreCollection<
    AppSchema,
    Comment,
    (_$RecipesCollection, _$CommentsCollection)
  >
  get comments =>
      FirestoreCollection<
        AppSchema,
        Comment,
        (_$RecipesCollection, _$CommentsCollection)
      >(
        query: ref.collection('comments'),
        converter: const _$CommentJsonConverter(),
        documentIdField: 'id',
      );

  /// Access like subcollection
  FirestoreCollection<AppSchema, User, (_$RecipesCollection, _$LikeCollection)>
  get like =>
      FirestoreCollection<
        AppSchema,
        User,
        (_$RecipesCollection, _$LikeCollection)
      >(
        query: ref.collection('like'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for recipes/*/comments collection
extension $AppSchemaRecipesCommentsDocument
    on
        FirestoreDocument<
          AppSchema,
          Comment,
          (_$RecipesCollection, _$CommentsCollection)
        > {
  /// Access users subcollection
  FirestoreCollection<
    AppSchema,
    User,
    (_$RecipesCollection, _$CommentsCollection, _$UsersCollection)
  >
  get users =>
      FirestoreCollection<
        AppSchema,
        User,
        (_$RecipesCollection, _$CommentsCollection, _$UsersCollection)
      >(
        query: ref.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to BatchContext<AppSchema>
extension AppSchemaBatchContextExtensions on BatchContext<AppSchema> {
  /// Access users collection
  BatchCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      BatchCollection(
        collection: firestoreInstance.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
        context: this,
      );

  /// Access recipes collection
  BatchCollection<AppSchema, Recipe, (_$RecipesCollection,)> get recipes =>
      BatchCollection(
        collection: firestoreInstance.collection('recipes'),
        converter: const _$RecipeJsonConverter(),
        documentIdField: 'id',
        context: this,
      );

  /// Access ingredients collection
  BatchCollection<AppSchema, Ingredient, (_$IngredientsCollection,)>
  get ingredients => BatchCollection(
    collection: firestoreInstance.collection('ingredients'),
    converter: const _$IngredientJsonConverter(),
    documentIdField: 'id',
    context: this,
  );
}

/// Batch document class for users collection
extension $AppSchemaUsersBatchDocument
    on BatchDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access friends subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, User, (_$UsersCollection, _$FriendsCollection)>
  get friends => getBatchCollection(
    parent: this,
    name: 'friends',
    converter: const _$UserJsonConverter(),
    documentIdField: 'id',
  );

  /// Access saved_recipes subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Recipe,
    (_$UsersCollection, _$Saved_recipesCollection)
  >
  get savedRecipes => getBatchCollection(
    parent: this,
    name: 'saved_recipes',
    converter: const _$RecipeJsonConverter(),
    documentIdField: 'id',
  );

  /// Access permanent_ingredients subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Ingredient,
    (_$UsersCollection, _$Permanent_ingredientsCollection)
  >
  get permanentIngredients => getBatchCollection(
    parent: this,
    name: 'permanent_ingredients',
    converter: const _$IngredientJsonConverter(),
    documentIdField: 'id',
  );
}

/// Batch document class for users/*/friends collection
extension $AppSchemaUsersFriendsBatchDocument
    on
        BatchDocument<
          AppSchema,
          User,
          (_$UsersCollection, _$FriendsCollection)
        > {
  /// Access messages subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Message,
    (_$UsersCollection, _$FriendsCollection, _$MessagesCollection)
  >
  get messages => getBatchCollection(
    parent: this,
    name: 'messages',
    converter: const _$MessageJsonConverter(),
    documentIdField: 'id',
  );
}

/// Batch document class for recipes collection
extension $AppSchemaRecipesBatchDocument
    on BatchDocument<AppSchema, Recipe, (_$RecipesCollection,)> {
  /// Access owners subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, User, (_$RecipesCollection, _$OwnersCollection)>
  get owners => getBatchCollection(
    parent: this,
    name: 'owners',
    converter: const _$UserJsonConverter(),
    documentIdField: 'id',
  );

  /// Access ingredients subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Ingredient,
    (_$RecipesCollection, _$IngredientsCollection)
  >
  get ingredients => getBatchCollection(
    parent: this,
    name: 'ingredients',
    converter: const _$IngredientJsonConverter(),
    documentIdField: 'id',
  );

  /// Access comments subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Comment,
    (_$RecipesCollection, _$CommentsCollection)
  >
  get comments => getBatchCollection(
    parent: this,
    name: 'comments',
    converter: const _$CommentJsonConverter(),
    documentIdField: 'id',
  );

  /// Access like subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, User, (_$RecipesCollection, _$LikeCollection)>
  get like => getBatchCollection(
    parent: this,
    name: 'like',
    converter: const _$UserJsonConverter(),
    documentIdField: 'id',
  );
}

/// Batch document class for recipes/*/comments collection
extension $AppSchemaRecipesCommentsBatchDocument
    on
        BatchDocument<
          AppSchema,
          Comment,
          (_$RecipesCollection, _$CommentsCollection)
        > {
  /// Access users subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    User,
    (_$RecipesCollection, _$CommentsCollection, _$UsersCollection)
  >
  get users => getBatchCollection(
    parent: this,
    name: 'users',
    converter: const _$UserJsonConverter(),
    documentIdField: 'id',
  );
}

//Generated converter for `FirestoreTimestampConverter`
class _$FirestoreTimestampConverterAnnotationConverter
    implements FirestoreConverter<DateTime, Object?> {
  const _$FirestoreTimestampConverterAnnotationConverter();

  @override
  DateTime fromJson(Object? data) =>
      FirestoreTimestampConverter().fromJson(data);

  @override
  Object? toJson(DateTime value) => FirestoreTimestampConverter().toJson(value);
}

//Generated converter for `User`
class _$UserJsonConverter
    implements FirestoreConverter<User, Map<String, dynamic>> {
  const _$UserJsonConverter();

  @override
  User fromJson(Map<String, dynamic> data) => User.fromJson(data);

  @override
  Map<String, dynamic> toJson(User value) => value.toJson();
}

//Generated converter for `Recipe`
class _$RecipeJsonConverter
    implements FirestoreConverter<Recipe, Map<String, dynamic>> {
  const _$RecipeJsonConverter();

  @override
  Recipe fromJson(Map<String, dynamic> data) => Recipe.fromJson(data);

  @override
  Map<String, dynamic> toJson(Recipe value) => value.toJson();
}

//Generated converter for `Ingredient`
class _$IngredientJsonConverter
    implements FirestoreConverter<Ingredient, Map<String, dynamic>> {
  const _$IngredientJsonConverter();

  @override
  Ingredient fromJson(Map<String, dynamic> data) => Ingredient.fromJson(data);

  @override
  Map<String, dynamic> toJson(Ingredient value) => value.toJson();
}

//Generated converter for `Message`
class _$MessageJsonConverter
    implements FirestoreConverter<Message, Map<String, dynamic>> {
  const _$MessageJsonConverter();

  @override
  Message fromJson(Map<String, dynamic> data) => Message.fromJson(data);

  @override
  Map<String, dynamic> toJson(Message value) => value.toJson();
}

//Generated converter for `Comment`
class _$CommentJsonConverter
    implements FirestoreConverter<Comment, Map<String, dynamic>> {
  const _$CommentJsonConverter();

  @override
  Comment fromJson(Map<String, dynamic> data) => Comment.fromJson(data);

  @override
  Map<String, dynamic> toJson(Comment value) => value.toJson();
}
