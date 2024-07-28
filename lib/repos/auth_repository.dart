import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../models/user.dart';
import '../services/firestore_service.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  Future<AppUser> signInWithEmail(String email, String password) async {
    firebase_auth.UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _firestoreService.getUser(userCredential.user!.uid);
  }

  Future<AppUser> signUpWithEmail(String email, String password, String name) async {
    firebase_auth.UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    AppUser user = AppUser(uid: userCredential.user!.uid, email: email, name: name);
    await _firestoreService.saveUser(user);
    return user;
  }

  void signOut() {
    _firebaseAuth.signOut();
  }
}
