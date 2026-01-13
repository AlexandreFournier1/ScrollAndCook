import 'package:dto/converter/firestore_timestamp_converter.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    @DocumentIdField()required String id,
    required String type, // text ou recipe

    String? text,

    String? recipeId,
    String? recipeTitle,
    String? recipeImage,
    String? recipeOwnerId,
    String? recipeOwnerImage,

    required bool isSentByMe,
    @FirestoreTimestampConverter()
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}