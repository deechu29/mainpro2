import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/all_screen/all_screen.dart';
import 'package:mainpro2/view/anniversary_screen/anniversary_screen.dart';
import 'package:mainpro2/view/birthday_screen/birthday_screen.dart';
import 'package:mainpro2/view/detail_screen/detail_screen.dart';
import 'package:mainpro2/view/fav_screen/fav_screen.dart';
import 'package:mainpro2/view/flower_screen/flower_screen.dart';
import 'package:mainpro2/view/love_n_romance_screen/love_n_romance_screen.dart';

class testingsample extends StatelessWidget {
  const testingsample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor:
            ColorConstanse.lightBackground, // Light background color
        appBar: AppBar(
          backgroundColor:
              ColorConstanse.primaryColor, // Primary color for AppBar
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context)
                      .openDrawer(); // Uncomment to open a Drawer
                },
                icon: Icon(
                  Icons.menu,
                  color: ColorConstanse.iconColor, // Icon color (darker shade)
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.favorite_outline,
                color: ColorConstanse.iconColor, // Favorite icon color
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Search",
                        style: TextStyle(color: ColorConstanse.labelColor)),
                    prefixIcon:
                        Icon(Icons.search, color: ColorConstanse.iconColor),
                    filled: true,
                    fillColor: ColorConstanse
                        .searchFieldBackground, // Background color for search field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: ColorConstanse.borderColor), // Border color
                    ),
                  ),
                ),
                SizedBox(height: 30),
                CarouselSlider(
                  items: List.generate(
                    6,
                    (index) => InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProductDetails(),
                        //   ),
                        // );
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorConstanse
                              .carouselBackground, // Background color for carousel item
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    autoPlayInterval: Duration(seconds: 2),
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enlargeFactor: .2,
                    height: 150,
                    autoPlay: true,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorConstanse
                        .primaryTextColor, // Primary text color for titles
                  ),
                ),
                TabBar(
                  labelColor:
                      ColorConstanse.tabSelectedColor, // Selected tab color
                  unselectedLabelColor:
                      ColorConstanse.tabUnselectedColor, // Unselected tab color
                  labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: "All",
                      icon: Icon(Icons.card_giftcard_outlined),
                    ),
                    Tab(
                      text: "Birthday",
                      icon: Icon(Icons.cake_outlined),
                    ),
                    Tab(
                      text: "Flower",
                      icon: Icon(Icons.local_florist_outlined),
                    ),
                    Tab(
                      text: "Love",
                      icon: Icon(Icons.favorite_outline),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    children: [
                      AllScreen(),
                      BirthdayScreen(),
                      FlowerScreen(),
                      LoveNRomanceScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
