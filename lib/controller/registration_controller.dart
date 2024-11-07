import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/view/login_screen/login_screen2.dart';

class RegistrationController with ChangeNotifier {
  bool isLoading = false;
  onRegister({required String email, required String pass,required BuildContext context}) async {
    isLoading = true;
    notifyListeners();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if(credential.user?.uid != null){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen2(),) );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
