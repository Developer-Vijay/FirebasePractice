import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// user Object Based on FirebaseUser
  Users? _userFromFirebase(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }
  // sign with annonmously

  Future signInAnon() async {
    try {
      final authResult = await _auth.signInAnonymously();
      final user = authResult.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign with email and Password

  // signOut

  // register with email and Password
}
