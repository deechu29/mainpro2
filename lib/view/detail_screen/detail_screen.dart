import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.url,
    required this.title,
    required this.price,
    required this.desc,
  });

  final String url, title, desc;
  final num price;

  // final String title, img;
  // final String price;
  // final String? des;

  @override
  Widget build(BuildContext context) {
    var cartItems = FirebaseFirestore.instance.collection("Cartitems");
    var favitems = FirebaseFirestore.instance.collection("favitems");

    // var homepro;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            height: 400,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(url))),
                            child: InkWell(
                              onTap: () async {
                                try {
                                  // Check if product is already in the fav
                                  final querySnapshot = await favitems
                                      .where('title', isEqualTo: title)
                                      .get();

                                  if (querySnapshot.docs.isEmpty) {
                                    // Add to fav if it doesn’t already exist
                                    await favitems.add({
                                      'url': url,
                                      'title': title,
                                      'quantity': 1,
                                      'price': price,
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '$title added to favourate')),
                                    );
                                  } else {
                                    // Show message if already in cart
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '$title already in favourate')),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Error adding to favourate: $e')),
                                  );
                                }
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            desc,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text("choose size",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Text("s",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Text("M",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey))),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Text("L",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey))),
                            SizedBox(
                              width: 10,
                            )
                          ])
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Divider(),
                    Row(
                      children: [Text("price")],
                    ),
                    Row(
                      children: [
                        Text(
                          "₹${price.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              try {
                                // Check if product is already in the cart
                                final querySnapshot = await cartItems
                                    .where('title', isEqualTo: title)
                                    .get();

                                if (querySnapshot.docs.isEmpty) {
                                  // Add to cart if it doesn’t already exist
                                  await cartItems.add({
                                    'url': url,
                                    'title': title,
                                    'quantity': 1,
                                    'price': price,
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('$title added to cart')),
                                  );
                                } else {
                                  // Show message if already in cart
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('$title already in cart')),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Error adding to cart: $e')),
                                );
                              }
                            },
                            child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.local_mall_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "add to cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
