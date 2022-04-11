import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 50.0),
          child: MaterialButton(
            child: const Text("Sign in Annoysmously"),
            onPressed: (() async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print("Error Sign In");
              } else {
                print("success Fully SignIn");
                print(result.uid);
              }
            }),
          ),
        ));
  }
}
