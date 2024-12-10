import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/detail_screen/detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  @override
  Widget build(BuildContext context) {
    var birthdaygift = FirebaseFirestore.instance.collection("birthdaygift");
    return //Use a SizedBox to constrain the height of the GridView
        StreamBuilder<QuerySnapshot>(
      stream: birthdaygift.snapshots(),
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
                    color: Colors.grey[800],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        data['title'],
                        style: TextStyle(color: ColorConstanse.white),
                      ),
                      Text("price: ${data['price'].toString()}",
                          style: TextStyle(color: ColorConstanse.white))
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
                              desc: data['desc'],
                              price: data['price'],
                              url: data['url'],
                              title: data['title']),
                        ));
                  },
                  child: Container(

                      // for implementation of shimmer
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl: data['url'],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                              child: Container(
                                height: 180,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                              ),
                              baseColor: ColorConstanse.white,
                              highlightColor: ColorConstanse.grey),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: CachedNetworkImageProvider(data['url'])),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      height: 180,
                      width: 300),
                ),
                // Positioned(
                //   bottom: 20,
                //   right: 0,
                // child: Container(
                //   child: Icon(Icons.add),
                //   height: 30,
                //   width: 30,
                //   decoration: BoxDecoration(
                //     borderRadius:
                //         BorderRadius.only(bottomRight: Radius.circular(20)),
                //     color: ColorConstanse.blue,
                //   ),
                // ),
                //),
              ]);
            });
      },
    );
  }
}
