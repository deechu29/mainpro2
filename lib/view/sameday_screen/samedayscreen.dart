import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:mainpro2/view/detail_screen/detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class samedayscreen extends StatefulWidget {
  const samedayscreen({super.key});

  @override
  State<samedayscreen> createState() => _samedayscreenState();
}

class _samedayscreenState extends State<samedayscreen> {
  @override
  Widget build(BuildContext context) {
    var sameday = FirebaseFirestore.instance.collection("sameday");
    return StreamBuilder<QuerySnapshot>(
      stream: sameday.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SizedBox(
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 260,
                      width: 300,
                      color: Colors.amber,
                      // width: MediaQuery.of(context).size.width,
                      // height: 50,
                      // margin: EdgeInsets.only(left: 20, right: 20),
                    )
                  ],
                )),
          ));
        }

        final documents = snapshot.data!.docs;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorConstanse.white,
            title: Text(
              'Same  Day Delivery',
              style: TextStyle(color: ColorConstanse.mainblack),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: documents.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 280,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data =
                          documents[index].data()! as Map<String, dynamic>;
                      return Stack(children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(data["title"]),
                                Text("price: ${data["price"].toString()}"),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            height: 260,
                            width: 300,
                          ),
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
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      CachedNetworkImageProvider(data["url"])),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            height: 190,
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
                              color: ColorConstanse.blue,
                            ),
                          ),
                        ),
                      ]);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
