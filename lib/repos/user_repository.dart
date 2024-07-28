import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import '../services/firestore_service.dart';

class UserRepository {
  final FirestoreService _firestoreService = FirestoreService();

  Future<AppUser> fetchUserDetails(String uid) async {
    return await _firestoreService.getUser(uid);
  }

  Future<void> saveUserDetails(User user) async {
    await _firestoreService.saveUser(user as AppUser);
  }
}
