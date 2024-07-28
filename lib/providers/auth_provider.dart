import 'package:flutter/material.dart';
import '../repos/auth_repository.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  AppUser? _user;

  AppUser? get user => _user;

  Future<void> signUp(String email, String password, String name) async {
    try {
      _user = await _authRepository.signUpWithEmail(email, password, name);
      notifyListeners();
    } catch (error) {
      print('Sign Up Error: $error');
      // Handle error appropriately
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _user = await _authRepository.signInWithEmail(email, password);
      notifyListeners();
    } catch (error) {
      print('Sign In Error: $error');
      // Handle error appropriately
    }
  }

  void signOut() {
    _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
