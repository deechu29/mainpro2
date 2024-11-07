import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var favitems = FirebaseFirestore.instance.collection("favitems");
    // Function to calculate total amount

    void incrementQuantity(DocumentSnapshot document) async {
      int currentQuantity = document['quantity'];
      await favitems.doc(document.id).update({'quantity': currentQuantity + 1});
    }

    void decrementQuantity(DocumentSnapshot document) async {
      int currentQuantity = document['quantity'];
      if (currentQuantity > 1) {
        await favitems
            .doc(document.id)
            .update({'quantity': currentQuantity - 1});
      }
    }

    return Scaffold(
        backgroundColor: ColorConstanse.mainblack,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorConstanse.mainblack,
          title: Text(
            'Favourite',
            style: TextStyle(color: ColorConstanse.white),
          ),
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: favitems.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text("error");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final documents = snapshot.data!.docs;
                          //calculateTotal(documents);
                          return ListView.separated(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data = documents[index]
                                    .data()! as Map<String, dynamic>;
                                return Card(
                                  color: Colors
                                      .grey[900], // Dark background for card
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Image container for the gift with a fallback for null or empty imageUrl
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  data[
                                                      'url']), // Fallback image
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                            width:
                                                16), // Add spacing between image and text

                                        // Gift Name and Price
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                data['title'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors
                                                      .white, // White text for dark background
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "price:${data["price"].toString()}",
                                                style: TextStyle(
                                                    color: Colors
                                                        .white), // White price text
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Quantity Selector
                                        // Row(
                                        //   children: [
                                        //     IconButton(
                                        //       onPressed: () {
                                        //         decrementQuantity(
                                        //             documents[index]);
                                        //       },
                                        //       icon: Icon(f
                                        //           Icons.remove_circle_outline,
                                        //           color: Colors.white),
                                        //     ),
                                        //     Text(
                                        //       data['quantity'].toString(),
                                        //       style: TextStyle(
                                        //           color: Colors
                                        //               .white), // White quantity text
                                        //     ),
                                        //     IconButton(
                                        //       onPressed: () {
                                        //         incrementQuantity(
                                        //             documents[index]);
                                        //       },
                                        //       //onAdd,
                                        //       icon: Icon(
                                        //           Icons.add_circle_outline,
                                        //           color: Colors.white),
                                        //     ),
                                        //   ],
                                        // ),

                                        // Remove from Cart
                                        IconButton(
                                          onPressed: () async {
                                            await favitems
                                                .doc(documents[index].id)
                                                .delete();
                                          },
                                          //onDelete,

                                          icon: Icon(Icons.favorite,
                                              color: Colors.redAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: documents.length);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
