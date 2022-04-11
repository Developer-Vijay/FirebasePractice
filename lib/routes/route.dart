import 'package:auto_route/annotations.dart';
import 'package:firebase_practice/view/auth/login.dart';
import 'package:firebase_practice/view/auth/otp_screen.dart';
import 'package:firebase_practice/view/auth/signup.dart';
import 'package:firebase_practice/view/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Login),
    AutoRoute(page: SignUp),
    AutoRoute(page: OtpScreen),
    AutoRoute(page: SplashScreen, initial: true)
  ],
)
class $AppRouter {}
