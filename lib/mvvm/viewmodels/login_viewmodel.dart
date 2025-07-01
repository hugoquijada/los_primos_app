
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../core/services/services.dart';

class LoginViewModel extends ChangeNotifier {

  final AuthService _auth = AuthService();

  User? _usuario;
  User? get usuario => _usuario;

  bool get sesionIniciada => _usuario != null;

  LoginViewModel() {
    _auth.authStateChange().listen((User? user) {
      _usuario = user;
      notifyListeners();
    });
  }

  Future<void> iniciarSesion(String correo, String clave) async {
    try {
      await _auth.iniciarSesion(correo, clave);
    } catch(e) {
      rethrow;
    }
  }

  Future<void> cerrarSesion() async {
    await _auth.cerrarSesion();
  }
}