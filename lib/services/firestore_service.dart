import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(AppUser user) async {
    await _db.collection('users').doc(user.uid).set(user.toJson());
  }

  Future<AppUser> getUser(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    final data = doc.data() as Map<String, dynamic>;
    return AppUser.fromJson(data);
  }
}
