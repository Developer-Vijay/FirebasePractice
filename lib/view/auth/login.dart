import 'package:firebase_practice/constants/app_colors.dart';
import 'package:firebase_practice/constants/app_size_widget.dart';
import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthService _auth = AuthService();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/upper.svg",
                      alignment: Alignment.center,
                      width: AppSizeConfig.widthMultiplier * 100,
                    ),
                    Positioned(
                        left: AppSizeConfig.widthMultiplier * 35,
                        right: AppSizeConfig.widthMultiplier * 35,
                        top: AppSizeConfig.widthMultiplier * 25,
                        bottom: AppSizeConfig.widthMultiplier * 3,
                        child: SvgPicture.asset(
                          "assets/images/centerLogo.svg",
                          width: AppSizeConfig.widthMultiplier * 5,
                          height:
                              AppSizeConfig.imageSizeMultiplier * 25,
                        ))
                  ],
                ),
                SizedBox(
                  height: AppSizeConfig.heightMultiplier * 4.6,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29),
                  child: Text(
                    "Enter your phone number",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 29.0, vertical: 10),
                  child: Form(child: _numberField()),
                ),
                SizedBox(
                  height: AppSizeConfig.heightMultiplier * 1,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Next',
                    ),
                    minWidth: AppSizeConfig.widthMultiplier * 85,
                    height: AppSizeConfig.heightMultiplier * 5,
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColors.secondaryColor,
                    textColor: AppColors.whitextColor,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () async {
                          dynamic result =
                              await _auth.signInWithEmailPasswd(
                                  "vijaysahoo147@gmail.com", "23432");

                          if (result == null) {
                            print("failed");
                          } else {
                            print("Success");
                            print(result.uid);
                          }
                        },
                        child: Icon(Icons.email),
                        textColor: AppColors.whitextColor,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text("Signed in Annoysmously"),
                        textColor: AppColors.whitextColor,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 1.1,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/brainArc.svg",
                          fit: BoxFit.fill,
                          width: AppSizeConfig.widthMultiplier * 100,
                          height: AppSizeConfig.heightMultiplier * 50,
                        ),
                      ],
                    )),
              ]),
        ),
      ),
    );
  }
}

TextFormField _emailField() {
  return TextFormField(
      style: const TextStyle(
        color: AppColors.secondaryColor,
      ),
      cursorColor: AppColors.secondaryColor,
      enabled: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Padding(
            padding: EdgeInsets.only(
              left: 12,
              bottom: 2,
              right: 4,
            ),
            child: Icon(Icons.email)),
      ));
}

TextFormField _PasswordField() {
  return TextFormField(
      style: const TextStyle(
        color: AppColors.secondaryColor,
      ),
      cursorColor: AppColors.secondaryColor,
      enabled: true,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Padding(
            padding: EdgeInsets.only(
              left: 12,
              bottom: 2,
              right: 4,
            ),
            child: Icon(Icons.email)),
      ));
}

TextFormField _numberField() {
  return TextFormField(
    style: const TextStyle(
      color: AppColors.secondaryColor,
    ),
    cursorColor: AppColors.secondaryColor,
    enabled: true,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      prefixIcon: const Padding(
        padding: EdgeInsets.only(
          left: 12,
          bottom: 2,
          right: 4,
        ),
        child: Text(
          "+91",
          style: TextStyle(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 0,
        minHeight: 0,
      ),
      hintText: " 00000000000",
      enabled: true,
      focusColor: AppColors.secondaryColor,
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
      hintStyle: const TextStyle(color: AppColors.secondaryColor),
    ),
  );
}
