import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/constants/app_size_widget.dart';
import 'package:firebase_practice/routes/route.gr.dart';
import 'package:firebase_practice/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_practice/Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        AppSizeConfig().init(constraints, orientation);
        return StreamProvider<Users?>.value(
          value: AuthService().user,
          initialData: null,
          child: MaterialApp.router(
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
          ),
        );
      });
    }));
  }
}
