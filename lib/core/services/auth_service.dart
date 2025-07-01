import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get usuario => _auth.currentUser;

  Stream<User?> authStateChange() => _auth.authStateChanges();

  Future<User?> iniciarSesion(String correo, String clave) async {
    final result = await _auth.signInWithEmailAndPassword(email: correo, password: clave);
    return result.user;
  }

  Future<void> cerrarSesion() async {
    await _auth.signOut();
  }

}