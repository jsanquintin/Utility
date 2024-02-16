import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      errorMessage = "El correo electrónico y la contraseña no pueden estar vacíos.";
      return false;
    }
    try {
      isLoading = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading = false;
      return true;
    } catch (e) {
      errorMessage = "Error al iniciar sesión con correo electrónico y contraseña";
      isLoading = false;
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      errorMessage = "Error al cerrar sesión";
    }
  }
}
