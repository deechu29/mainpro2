import 'package:flutter/material.dart';
import 'package:mainpro2/controller/logout_controller.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:provider/provider.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({super.key});

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  @override
  Widget build(BuildContext context) {
    final logoutprv = context.watch<LogoutController>();

    return Scaffold(
      backgroundColor: ColorConstanse.mainblack,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: ColorConstanse.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(radius: 50),
            const SizedBox(height: 10),
            Text(
              "John",
              style: TextStyle(color: ColorConstanse.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "john@123",
              style: TextStyle(color: ColorConstanse.white, fontSize: 16),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.edit, color: ColorConstanse.white),
              title: Text(
                'Edit Profile',
                style: TextStyle(color: ColorConstanse.white, fontSize: 17),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 17),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard, color: ColorConstanse.white),
              title: Text(
                'View Wish List',
                style: TextStyle(color: ColorConstanse.white, fontSize: 17),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 17),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            ListTile(
              leading: Icon(Icons.history, color: ColorConstanse.white),
              title: Text(
                'Recent Gifts',
                style: TextStyle(color: ColorConstanse.white, fontSize: 17),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 17),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: ColorConstanse.white),
              title: Text(
                "Settings",
                style: TextStyle(color: ColorConstanse.white, fontSize: 17),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 17),
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: ColorConstanse.red),
              title: Text(
                'Logout',
                style: TextStyle(color: ColorConstanse.red, fontSize: 17),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 17),
              onTap: () {
                logoutprv.confirmLogout(context);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}
