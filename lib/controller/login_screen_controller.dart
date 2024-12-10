import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/bottom_nav_screen/bottom_nav_screen.dart';

class LoginScreenController with ChangeNotifier {
  bool isLoading = false;
  onLogin(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (credential.user?.uid != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorConstanse.green,
            content: Text("user login sucessfully")));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavbarScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email'),
            backgroundColor: Colors.green,
          ),
        );
        print('No user found for that email.');
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
