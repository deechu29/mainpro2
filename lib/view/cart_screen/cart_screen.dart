import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/controller/cart_controller.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/address_screen/address_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
//  double totalAmount = 0.0;
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var cartItems = FirebaseFirestore.instance.collection("Cartitems");
    // Function to calculate total amount
    // void calculateTotal(List<DocumentSnapshot> documents) {
    //   double total = 0.0;
    //   for (var document in documents) {
    //     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //     total += (data['price'] * data['quantity']);
    //   }
    //   setState(() {
    //     totalAmount = total;
    //   });
    // }

    // void incrementQuantity(DocumentSnapshot document) async {
    //   int currentQuantity = document['quantity'];
    //   await cartItems
    //       .doc(document.id)
    //       .update({'quantity': currentQuantity + 1});
    // }

    // void decrementQuantity(DocumentSnapshot document) async {
    //   int currentQuantity = document['quantity'];
    //   if (currentQuantity > 1) {
    //     await cartItems
    //         .doc(document.id)
    //         .update({'quantity': currentQuantity - 1});
    //   }
    // }

    return Scaffold(
        backgroundColor: ColorConstanse.mainblack,
        appBar: AppBar(
          backgroundColor: ColorConstanse.mainblack,
          centerTitle: true,
          title: Text(
            'CartScreen',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: ColorConstanse.white),
          ),
        ),
        body: Consumer<CartController>(
          builder: (context, cartpro, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: cartItems.snapshots(),
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
                              cartpro.updateTotalAmount(documents);
                              return ListView.separated(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> data = documents[index]
                                        .data()! as Map<String, dynamic>;
                                    num itemQty = data["quantity"];
                                    return Card(
                                      color: Colors.grey[
                                          900], // Dark background for card
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    data['title'],
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .white, // White text for dark background
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    data["price"].toString(),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white), // White price text
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Quantity Selector
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    //decrementing quantity
                                                    cartpro.decrementQuantity(
                                                        documents[index].id,
                                                        itemQty);
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .remove_circle_outline,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  data['quantity'].toString(),
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white), // White quantity text
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    cartpro.incrementQuantity(
                                                        documents[index].id,
                                                        itemQty);
                                                  },
                                                  //onAdd,
                                                  icon: Icon(
                                                      Icons.add_circle_outline,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),

                                            // Remove from Cart
                                            IconButton(
                                              onPressed: () {
                                                cartpro.removeCartItem(
                                                    documents[index].id);
                                              },
                                              //onDelete,
                                              icon: Icon(Icons.delete_outline,
                                                  color: Colors.redAccent),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: documents.length);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Divider(
                            color:
                                Colors.white), // White divider for black theme
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White text
                              ),
                            ),
                            Text(
                              "₹${cartpro.totalAmount}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White text
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // Checkout Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  Colors.white, // Black text on button
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddressScreen(
                                        totalamount: cartpro.totalAmount),
                                  ));
                            },
                            child: Text('Proceed to Checkout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:mainpro2/view/address_screen/address_screen.dart';

// class CartScreen extends StatefulWidget {
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Set black background
//       appBar: AppBar(
//         title: Text('My Cart'),
//         backgroundColor: Colors.black, // AppBar black background
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           // Gift Items List
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cartItems[index];
//                 return CartItemCard(
//                   item: item,
//                   onAdd: () {
//                     setState(() {
//                       item.quantity++;
//                     });
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${item.name} quantity increased'),
//                       ),
//                     );
//                   },
//                   onRemove: () {
//                     setState(() {
//                       if (item.quantity > 1) {
//                         item.quantity--;
//                       } else {
//                         cartItems.remove(item);
//                       }
//                     });
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${item.name} quantity decreased'),
//                       ),
//                     );
//                   },
//                   onDelete: () {
//                     setState(() {
//                       cartItems.remove(item);
//                     });
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('${item.name} removed from cart')),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),

//           // Total Amount Section
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Divider(color: Colors.white), // White divider for black theme
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total:',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // White text
//                       ),
//                     ),
//                     Text(
//                       '\$${calculateTotal().toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // White text
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 // Checkout Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: Colors.white, // Black text on button
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AddressScreen(),
//                           ));
//                     },
//                     child: Text('Proceed to Checkout'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to calculate the total price
//   double calculateTotal() {
//     double total = 0.0;
//     for (var item in cartItems) {
//       total += item.price * item.quantity;
//     }
//     return total;
//   }
// }

// // A sample cart item model with an image URL
// class CartItem {
//   final String name;
//   final double price;
//   final String imageUrl; // Add imageUrl
//   int quantity;

//   CartItem({
//     required this.name,
//     required this.price,
//     required this.imageUrl, // Initialize imageUrl
//     this.quantity = 1,
//   });
// }

// // Sample cart items for demonstration with image URLs
// List<CartItem> cartItems = [
//   CartItem(
//       name: 'Gift 1',
//       price: 25.0,
//       imageUrl:
//           'https://i.pinimg.com/736x/0f/be/62/0fbe62efa1f3de73df39e0dd116a669d.jpg',
//       quantity: 2),
//   CartItem(
//       name: 'Gift 2',
//       price: 15.0,
//       imageUrl:
//           'https://i.pinimg.com/564x/96/f2/f1/96f2f1c70c897d35652982444c497ef1.jpg',
//       quantity: 1),
//   CartItem(
//       name: 'Gift 3',
//       price: 50.0,
//       imageUrl:
//           'https://i.pinimg.com/564x/2d/7a/38/2d7a38f131be4b0897126310ad0694e0.jpg',
//       quantity: 1),
// ];

// // Widget for each cart item card with image handling
// class CartItemCard extends StatelessWidget {
//   final CartItem item;
//   final VoidCallback onAdd;
//   final VoidCallback onRemove;
//   final VoidCallback onDelete;

//   CartItemCard({
//     required this.item,
//     required this.onAdd,
//     required this.onRemove,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         color: Colors.grey[900], // Dark background for card
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Image container for the gift with a fallback for null or empty imageUrl
//               Container(
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   image: DecorationImage(
//                     image: item.imageUrl.isNotEmpty
//                         ? NetworkImage(item.imageUrl)
//                         : AssetImage('assets/placeholder.png')
//                             as ImageProvider, // Fallback image
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               SizedBox(width: 16), // Add spacing between image and text

//               // Gift Name and Price
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item.name,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // White text for dark background
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       '\$${item.price}',
//                       style: TextStyle(color: Colors.white), // White price text
//                     ),
//                   ],
//                 ),
//               ),

//               // Quantity Selector
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: onRemove,
//                     icon:
//                         Icon(Icons.remove_circle_outline, color: Colors.white),
//                   ),
//                   Text(
//                     '${item.quantity}',
//                     style:
//                         TextStyle(color: Colors.white), // White quantity text
//                   ),
//                   IconButton(
//                     onPressed: onAdd,
//                     icon: Icon(Icons.add_circle_outline, color: Colors.white),
//                   ),
//                 ],
//               ),

//               // Remove from Cart
//               IconButton(
//                 onPressed: onDelete,
//                 icon: Icon(Icons.delete_outline, color: Colors.redAccent),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
