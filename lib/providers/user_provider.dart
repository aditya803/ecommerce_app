import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/firestore_service.dart';

class UserProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  AppUser? _user;

  AppUser? get user => _user;

  Future<void> fetchUserDetails(String uid) async {
    _user = await _firestoreService.getUser(uid);
    notifyListeners();
  }

  Future<void> updateUserDetails(AppUser user) async {
    await _firestoreService.saveUser(user);
    _user = user;
    notifyListeners();
  }
}
