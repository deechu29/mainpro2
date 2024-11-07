import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/bottom_nav_screen/widget/drawer_screen.dart';
import 'package:mainpro2/view/cart_screen/cart_screen.dart';
import 'package:mainpro2/view/sameday_screen/samedayscreen.dart';
import 'package:mainpro2/view/home_screen/home_screen.dart';
import 'package:mainpro2/view/profile_screen/profile_screen2.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _selectedIndex = 0;
  final List<Widget> myscreen = [
    HomeScreen(),
    samedayscreen(),
    CartScreen(),
    ProfileScreen2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        drawer: DrawerScreen(),
        body: myscreen[_selectedIndex],
        backgroundColor: ColorConstanse.mainblack,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              selectedFontSize: 10,
              unselectedFontSize: 10,
              backgroundColor: ColorConstanse.mainblack,
              onTap: (value) {
                _selectedIndex = value;

                setState(() {});
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedItemColor: ColorConstanse.white,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: ColorConstanse.white,
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_shipping_outlined),
                    label: "Same day"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ]),
        ));
  }
}
