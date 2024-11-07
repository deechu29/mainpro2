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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        backgroundColor: ColorConstanse.mainblack,
        appBar: AppBar(
          backgroundColor: ColorConstanse.mainblack,
          centerTitle: true,
          title: Text(
            "Gift App",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorConstanse.white),
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
                Icons.favorite,
                color: ColorConstanse.red,
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
                    //   fillColor: Colors.grey[800],
                    label: Text("Search"),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                          color: Colors.amber,
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
                      color: ColorConstanse.mainblack),
                ),
                TabBar(
                  labelColor: ColorConstanse.mainblack,
                  unselectedLabelColor: ColorConstanse.LIGHTGREY,
                  labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  //isScrollable: true,
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
                    // Tab(
                    //   text: "Ceremony",
                    //   icon: Icon(Icons.handshake_outlined),
                    // ),
                    Tab(
                      text: "Love",
                      icon: Icon(Icons.favorite_outline),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Use a SizedBox to constrain the height of the TabBarView
                SizedBox(
                  height: 500, // Adjust the height as needed
                  child: TabBarView(
                    children: [
                      AllScreen(),
                      BirthdayScreen(),
                      FlowerScreen(),
                      // anniversaryscreen(),
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
