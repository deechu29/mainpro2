import 'package:flutter/material.dart';
import 'package:mainpro2/controller/login_screen_controller.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';

import 'package:mainpro2/view/login_screen/register_screen2.dart';
import 'package:provider/provider.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  bool _isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // for appbar transparent
      appBar: AppBar(
        forceMaterialTransparency: true, //for appbar transparent
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Color(0xff1C1C1C)],
              ),
            ),
          ),
          // Gift Icon Background Decoration
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.1,
              child: Icon(
                Icons.card_giftcard,
                size: 200,
                color: Colors.white,
              ),
            ),
          ),
          // Floating Gift Box on Bottom Left
          Positioned(
            bottom: -50,
            left: -50,
            child: Opacity(
              opacity: 0.1,
              child: Icon(
                Icons.card_giftcard,
                size: 150,
                color: Colors.white,
              ),
            ),
          ),
          // Login Form Content
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo (Gift Icon)
                    Icon(
                      Icons.card_giftcard,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to Giftify!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'The best way to send love and gifts.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (value.contains("@")) {
                          return null;
                        } else {
                          return "please enter a proper email";
                        }
                      },
                      controller: emailController,
                      style: TextStyle(color: ColorConstanse.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.mail_outline_outlined,
                          color: ColorConstanse.white,
                        ),
                        hintText: "Email",
                        fillColor: ColorConstanse.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },

                      controller: passController,
                      //   bool obscureText = false,
                      style: TextStyle(color: ColorConstanse.white),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          // obscureText: !_isPasswordVisible,
                          color: ColorConstanse.white,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        hintText: "Password",
                        fillColor: ColorConstanse.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginScreenController>().onLogin(
                              email: emailController.text,
                              pass: passController.text,
                              context: context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dont have an account?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen2(),
                                ));
                          },
                          child: Text(
                            'register',
                            style: TextStyle(
                              color: ColorConstanse.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
