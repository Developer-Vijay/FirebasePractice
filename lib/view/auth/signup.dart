import 'package:firebase_practice/Widgets/buttons.dart';
import 'package:firebase_practice/constants/app_size_widget.dart';
import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_colors.dart';

AuthService _auth = AuthService();

class SignUp extends ConsumerWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Column(children: [
        SizedBox(
          height: AppSizeConfig.heightMultiplier * 4,
        ),
        const Text("Register"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(child: emailField(_emailController)),
        ),
        SizedBox(
          height: AppSizeConfig.heightMultiplier * 4,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(child: passwordField(_passwordController)),
        ),
        SizedBox(
          height: AppSizeConfig.heightMultiplier * 4,
        ),
        Buttons(
            name: "SigupUsingEmailAndPassword",
            textColor: AppColors.whitextColor,
            onpress: _auth.registerWithEmailAndPassword(
                _emailController, _passwordController),
            buttoncolor: AppColors.secondaryColor),
      ]),
    );
  }

  TextFormField emailField(TextEditingController _emailController) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        label: const Text("Email"),
        prefixIcon: const Icon(Icons.email),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: AppColors.secondaryColor, width: 1.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: AppColors.secondaryColor, width: 1.3),
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  TextFormField passwordField(
      TextEditingController _passwordController) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        label: const Text("Password"),
        prefixIcon: const Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: AppColors.secondaryColor, width: 1.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: AppColors.secondaryColor, width: 1.3),
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
