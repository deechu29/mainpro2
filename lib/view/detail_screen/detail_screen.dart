import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });
  // final String title, img;
  // final String price;
  // final String? des;

  @override
  Widget build(BuildContext context) {
    // var homepro;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Row(
                //   children: [
                //     GestureDetector(
                //         onTap: () {
                //           Navigator.pop(context);
                //         },
                //         child: Icon(Icons.arrow_back)),
                //   ],
                // ),
                // Center(
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Center(
                //         child: Text(
                //           "title",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 20),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Row(
                //   children: [Icon(Icons.notifications_none_sharp)],
                // ),
              ]),
              Expanded(
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
                                image: NetworkImage(
                                    "https://i.pinimg.com/236x/a5/44/6d/a5446d879fd292a6addd3aa1530d0f7b.jpgs"))),
                        child: Container(
                          child: Container(
                            child: Icon(
                              Icons.favorite_outline,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 100,
                          ),
                          width: 20,
                          height: 30,
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Text(
                        "title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "des",
                        style: TextStyle(color: Colors.black),
                      ),
                      // Text("choose size",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold, fontSize: 15)),
                      // Row(children: [
                      //   Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Container(
                      //         height: 40,
                      //         width: 40,
                      //         child: Center(
                      //           child: Text("s",
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 15)),
                      //         ),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.grey))),
                      //   ),
                      //   SizedBox(
                      //     width: 10,
                      //   ),
                      //   Container(
                      //       height: 40,
                      //       width: 40,
                      //       child: Center(
                      //         child: Text("M",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 15)),
                      //       ),
                      //       decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.grey))),
                      //   SizedBox(
                      //     width: 10,
                      //   ),
                      //   Container(
                      //       height: 40,
                      //       width: 40,
                      //       child: Center(
                      //         child: Text("L",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 15)),
                      //       ),
                      //       decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.grey))),
                      //   SizedBox(
                      //     width: 10,
                      //   )
                      // ])
                    ],
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
                        "₹ price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
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
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "add to cart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
