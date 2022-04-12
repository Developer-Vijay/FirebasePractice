import 'package:auto_route/auto_route.dart';
import 'package:firebase_practice/constants/app_size_widget.dart';
import 'package:firebase_practice/routes/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      AutoRouter.of(context).push(const SignUp());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  "assets/images/designUpper.svg",
                  alignment: Alignment.center,
                  width: AppSizeConfig.widthMultiplier * 100,
                ),
              ),
            ),
            SizedBox(
              height: AppSizeConfig.heightMultiplier * 1,
            ),
            Center(
              child: SvgPicture.asset("assets/images/centerLogo.svg"),
            ),
            SizedBox(
              height: AppSizeConfig.heightMultiplier * 4,
            ),
            SvgPicture.asset(
              "assets/images/soulFull.svg",
              height: AppSizeConfig.heightMultiplier * 6,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child:
                    SvgPicture.asset("assets/images/lowerLeft.svg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
