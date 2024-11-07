import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/controller/login_screen_controller.dart';
import 'package:mainpro2/controller/registration_controller.dart';
import 'package:mainpro2/firebase_options.dart';

import 'package:mainpro2/view/slash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RegistrationController()),
          ChangeNotifierProvider(
            create: (context) => LoginScreenController(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()));
  }
}
