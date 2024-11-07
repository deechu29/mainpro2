import 'package:flutter/material.dart';

class TestingSample extends StatefulWidget {
  const TestingSample({super.key});

  @override
  State<TestingSample> createState() => _TestingSampleState();
}

class _TestingSampleState extends State<TestingSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
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
                        image: NetworkImage(""), // Fallback image
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
                          "name,",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                Colors.white, // White text for dark background
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "price",
                          style: TextStyle(
                              color: Colors.white), // White price text
                        ),
                      ],
                    ),
                  ),

                  // Quantity Selector
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_circle_outline,
                            color: Colors.white),
                      ),
                      Text(
                        'quantity',
                        style: TextStyle(
                            color: Colors.white), // White quantity text
                      ),
                      IconButton(
                        onPressed: () {},
                        //onAdd,
                        icon:
                            Icon(Icons.add_circle_outline, color: Colors.white),
                      ),
                    ],
                  ),

                  // Remove from Cart
                  IconButton(
                    onPressed: () {},
                    //onDelete,
                    icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
