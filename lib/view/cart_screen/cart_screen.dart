import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstanse.mainblack,
//       appBar: AppBar(
//         backgroundColor: ColorConstanse.mainblack,
//         title: Center(
//           child: Text(
//             "My cart",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, color: ColorConstanse.white),
//           ),
//         ),
//       ),
//       body: Column(
//           children: List.generate(
//         5,
//         (index) => Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           child: Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: ColorConstanse.mainblack,
//                 borderRadius: BorderRadius.circular(10)),
//             height: 100,
//             width: 400,
//             child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.fill, image: NetworkImage("")),
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(10)),
//                   height: 100,
//                   width: 100),
//               SizedBox(width: 30),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "detail",
//                         style: TextStyle(color: ColorConstanse.white),
//                       ),
//                       Icon(
//                         Icons.delete,
//                         color: Colors.red,
//                       )
//                     ],
//                   ),
//                   Text(
//                     "price",
//                     style: TextStyle(color: ColorConstanse.white),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: 230,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SizedBox(
//                           width: 90,
//                         ),
//                         Container(
//                           child: Icon(
//                             Icons.add,
//                             size: 20,
//                           ),
//                           height: 20,
//                           width: 20,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: ColorConstanse.blue),
//                         ),
//                         // SizedBox(
//                         //   width: 20,
//                         // ),
//                         Text(
//                           "1",
//                           style: TextStyle(color: ColorConstanse.white),
//                         ),
//                         Container(
//                           child: Icon(
//                             Icons.remove,
//                             size: 20,
//                           ),
//                           height: 20,
//                           width: 20,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: ColorConstanse.blue),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       )

//           // SizedBox(
//           //   height: 20,
//           // ),

//           ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

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
//                           content: Text('${item.name} quantity increased')),
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
//                           content: Text('${item.name} quantity decreased')),
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
//                       // Handle checkout action
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

// // A sample cart item model
// class CartItem {
//   final String name;
//   final double price;
//   int quantity;

//   CartItem({required this.name, required this.price, this.quantity = 1});
// }

// // Sample cart items for demonstration
// List<CartItem> cartItems = [
//   CartItem(name: 'Gift 1', price: 25.0, quantity: 2),
//   CartItem(name: 'Gift 2', price: 15.0, quantity: 1),
//   CartItem(name: 'Gift 3', price: 50.0, quantity: 1),
// ];

// // Widget for each cart item card
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
//               // Gift Name
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.name,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // White text for dark background
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     '\$${item.price}',
//                     style: TextStyle(color: Colors.white), // White price text
//                   ),
//                 ],
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

import 'package:flutter/material.dart';
import 'package:mainpro2/view/address_screen/address_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set black background
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.black, // AppBar black background
        elevation: 0,
      ),
      body: Column(
        children: [
          // Gift Items List
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemCard(
                  item: item,
                  onAdd: () {
                    setState(() {
                      item.quantity++;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} quantity increased'),
                      ),
                    );
                  },
                  onRemove: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      } else {
                        cartItems.remove(item);
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} quantity decreased'),
                      ),
                    );
                  },
                  onDelete: () {
                    setState(() {
                      cartItems.remove(item);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} removed from cart')),
                    );
                  },
                );
              },
            ),
          ),

          // Total Amount Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Divider(color: Colors.white), // White divider for black theme
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
                      '\$${calculateTotal().toStringAsFixed(2)}',
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
                      backgroundColor: Colors.white, // Black text on button
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressScreen(),
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
  }

  // Function to calculate the total price
  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

// A sample cart item model with an image URL
class CartItem {
  final String name;
  final double price;
  final String imageUrl; // Add imageUrl
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl, // Initialize imageUrl
    this.quantity = 1,
  });
}

// Sample cart items for demonstration with image URLs
List<CartItem> cartItems = [
  CartItem(
      name: 'Gift 1',
      price: 25.0,
      imageUrl:
          'https://i.pinimg.com/736x/0f/be/62/0fbe62efa1f3de73df39e0dd116a669d.jpg',
      quantity: 2),
  CartItem(
      name: 'Gift 2',
      price: 15.0,
      imageUrl:
          'https://i.pinimg.com/564x/96/f2/f1/96f2f1c70c897d35652982444c497ef1.jpg',
      quantity: 1),
  CartItem(
      name: 'Gift 3',
      price: 50.0,
      imageUrl:
          'https://i.pinimg.com/564x/2d/7a/38/2d7a38f131be4b0897126310ad0694e0.jpg',
      quantity: 1),
];

// Widget for each cart item card with image handling
class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  CartItemCard({
    required this.item,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[900], // Dark background for card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image container for the gift with a fallback for null or empty imageUrl
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: item.imageUrl.isNotEmpty
                        ? NetworkImage(item.imageUrl)
                        : AssetImage('assets/placeholder.png')
                            as ImageProvider, // Fallback image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 16), // Add spacing between image and text

              // Gift Name and Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for dark background
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${item.price}',
                      style: TextStyle(color: Colors.white), // White price text
                    ),
                  ],
                ),
              ),

              // Quantity Selector
              Row(
                children: [
                  IconButton(
                    onPressed: onRemove,
                    icon:
                        Icon(Icons.remove_circle_outline, color: Colors.white),
                  ),
                  Text(
                    '${item.quantity}',
                    style:
                        TextStyle(color: Colors.white), // White quantity text
                  ),
                  IconButton(
                    onPressed: onAdd,
                    icon: Icon(Icons.add_circle_outline, color: Colors.white),
                  ),
                ],
              ),

              // Remove from Cart
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete_outline, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
