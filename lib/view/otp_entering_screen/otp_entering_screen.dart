import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:mainpro2/view/otp_screen/otp_screen.dart';

class OtpNumberenterScreen extends StatelessWidget {
  const OtpNumberenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text("Verify your number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Text("phone number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("We have send you an",
                    style: TextStyle(
                        color: ColorConstanse.LIGHTGREY,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Text(" One Time Password(OTP)",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            Text("on this mobile number.",
                style: TextStyle(
                    color: ColorConstanse.LIGHTGREY,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            SizedBox(
              height: 48,
            ),
            Text("Enter mobile no.*",
                style: TextStyle(
                    color: ColorConstanse.LIGHTGREY,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(" Don’t have account?",
                    style: TextStyle(
                        color: ColorConstanse.LIGHTGREY,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbarScreen(),
                        ));
                  },
                  child: Text("Continue without account",
                      style: TextStyle(
                          color: ColorConstanse.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(),
                    ));
              },
              child: Container(
                  child: Center(
                      child: Text(
                    "Get Otp",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
