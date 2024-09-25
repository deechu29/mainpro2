import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/cart_screen/cart_screen.dart';
import 'package:mainpro2/view/home_screen/home_screen.dart';
import 'package:mainpro2/view/otp_entering_screen/otp_entering_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstanse.mainblack,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: ColorConstanse.mainblack,
                  height: 135,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/1898555/pexels-photo-1898555.jpeg?auto=compress&cs=tinysrgb&w=600"),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "hello",
                        style: TextStyle(
                            color: ColorConstanse.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "person",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ));
                  },
                  leading: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "My Cart",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Favorite",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.fire_truck_outlined,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Orders",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  leading: Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Home Page",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                ),
                SizedBox(height: 80),
                Divider(
                  indent: 20,
                  endIndent: 50,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpNumberenterScreen(),
                        ));
                  },
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
