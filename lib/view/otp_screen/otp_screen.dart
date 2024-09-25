import 'package:flutter/material.dart';
 
import 'package:mainpro2/view/bottom_nav_screen/bottom_nav_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OTP Varification",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: 50,
                          width: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          )),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("I didn't receive any code. RESEND")),
            SizedBox(
              height: 200,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbarScreen(),
                    ));
              },
              child: Container(
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}
