import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:mainpro2/utils/constants/color_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstanse.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: ColorConstanse.mainblack,
                ));
          },
        ),

        // leading: IconButton(
        //    onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: Text("Search"),
                  prefix: Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            CarouselSlider(
                items: List.generate(
                  6,
                  (index) => Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/1702373/pexels-photo-1702373.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")))),
                ),
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  enlargeFactor: .2,
                  height: 200,
                  autoPlay: true,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.amber,
                          height: 40,
                          width: 80,
                        ),
                        Text("Flower"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 280,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("data")],
                            ),
                            padding: EdgeInsets.all(10),
                            height: 260,
                            width: 300,
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.favorite_outline,
                                  size: 25,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              height: 200,
                              width: 300),
                          Positioned(
                            bottom: 20,
                            right: 0,
                            child: Container(
                              child: Icon(Icons.add),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ])))
          ],
        ),
      ),
    );
  }
}
