import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// user Object Based on FirebaseUser
  Users? _userFromFirebase(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<Users?> get user {
    return _auth
        .authStateChanges()
        .map((user) => _userFromFirebase(user!));
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
  Future signInWithEmailPasswd(String email, String password) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = authResult.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
    }
  }

  // signOut
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
  // register with email and Password

  Future registerWithEmailAndPassword(
      final email, final password) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email.toString(), password: password.toString());

      final user = authResult.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
