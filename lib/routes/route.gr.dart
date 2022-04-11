// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../view/auth/login.dart' as _i1;
import '../view/auth/signup.dart' as _i2;
import '../view/splash_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Login.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Login());
    },
    SignUp.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUp());
    },
    SplashScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(Login.name, path: '/Login'),
        _i4.RouteConfig(SignUp.name, path: '/sign-up'),
        _i4.RouteConfig(SplashScreen.name, path: '/')
      ];
}

/// generated route for
/// [_i1.Login]
class Login extends _i4.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/Login');

  static const String name = 'Login';
}

/// generated route for
/// [_i2.SignUp]
class SignUp extends _i4.PageRouteInfo<void> {
  const SignUp() : super(SignUp.name, path: '/sign-up');

  static const String name = 'SignUp';
}

/// generated route for
/// [_i3.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}
