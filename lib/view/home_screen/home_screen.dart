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
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstanse.white,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  // Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: ColorConstanse.mainblack,
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
              icon: Icon(Icons.favorite_outline),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(),
                          ),
                        );
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      icon: Container(
                        child: Column(
                          children: [
                            Icon(Icons.card_giftcard_outlined),
                            Text("All", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        height: 50,
                        width: 80,
                        color: ColorConstanse.green.withOpacity(0.1),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        color: ColorConstanse.green.withOpacity(0.1),
                        child: Column(
                          children: [
                            Icon(Icons.cake_outlined),
                            Text(
                              "Birthday",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        height: 50,
                        width: 80,
                      ),
                    ),
                    Tab(
                      icon: Container(
                        child: Column(
                          children: [
                            Icon(Icons.local_florist_outlined),
                            Text("Flower", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        height: 50,
                        width: 80,
                        color: ColorConstanse.green.withOpacity(0.1),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        child: Column(
                          children: [
                            Icon(Icons.handshake_outlined),
                            Text("Anniversary", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        height: 50,
                        width: 80,
                        color: ColorConstanse.green.withOpacity(0.1),
                      ),
                    ),
                    Tab(
                      icon: Container(
                          child: Column(
                            children: [
                              Icon(Icons.card_giftcard_outlined),
                              Text("Love N Romance",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          height: 50,
                          width: 100,
                          color: ColorConstanse.green.withOpacity(0.1)),
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
                      LoveNRomanceScreen(),
                      anniversaryscreen()
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
