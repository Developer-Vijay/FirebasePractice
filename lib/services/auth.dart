import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign with annonmously

  Future signInAnon() async {
    try {
      final authResult = await _auth.signInAnonymously();
      final user = authResult.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign with email and Password

  // signOut

  // register with email and Password
}
