import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/view/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:mainpro2/view/login_screen/login_screen2.dart';

class IntermediateScreen extends StatelessWidget {
  const IntermediateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BottomNavbarScreen();
        } else {
          return LoginScreen2();
        }
      },
    );
  }
}
