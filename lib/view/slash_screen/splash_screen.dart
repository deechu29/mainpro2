import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mainpro2/view/intermediate_screen.dart';
import 'package:mainpro2/view/login_screen/login_screen2.dart';

// Replace with your login screen path

void main() {
  runApp(GiftApp());
}

class GiftApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the next screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                IntermediateScreen()), // Replace with your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C), // Background color
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // App logo or image
          // Image.asset(
          //   'assets/gift_logo.png', // Your image asset
          //   height: 120,
          // ),
          SizedBox(height: 20),
          // App name text
          Text(
            'GiftApp',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          // Subtitle
          Text(
            'Your personal gifting assistant',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ]),
      ),
    );
  }
}


//  Text(
//               'GiftApp',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 10),
//             // Subtitle
//             Text(
//               'Your personal gifting assistant',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white70,
//               ),