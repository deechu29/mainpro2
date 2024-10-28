import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/detail_screen/detail_screen.dart';
import 'package:mainpro2/view/fav_screen/fav_screen.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({super.key});

  @override
  State<FlowerScreen> createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  @override
  Widget build(BuildContext context) {
    var flowergift = FirebaseFirestore.instance.collection("flowergift");
    return //Use a SizedBox to constrain the height of the GridView
        StreamBuilder<QuerySnapshot>(
      stream: flowergift.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final documents = snapshot.data!.docs;

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 280,
                crossAxisCount: 2),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  documents[index].data()! as Map<String, dynamic>;

              return Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.amber,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(data['title']),
                      Text("price: ${data['price'].toString()}")
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  height: 260,
                  width: 300,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                              url: data["url"],
                              title: data["title"],
                              price: data["price"],
                              desc: data["desc"]),
                        ));
                  },
                  child: Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.favorite_outline,
                          size: 25,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(data['url'])),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      height: 180,
                      width: 300),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    child: Icon(Icons.add),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20)),
                      color: ColorConstanse.blue,
                    ),
                  ),
                ),
              ]);
            });
      },
    );
  }
}
