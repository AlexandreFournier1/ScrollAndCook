import 'package:dto/dto.dart';

Future<bool> getIsFriendFromDb(FirestoreODM<AppSchema> db,String userId ,String friendId) async {
  final result = await db.users(userId).friends(friendId).get();

  if(result == null) {
    return false;
  } else {
    return true;
  }
}