import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorConstanse.Scaffoldcolor,
      appBar: AppBar(
        backgroundColor: ColorConstanse.white,
        title: Center(
          child: Text(
            "My cart",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: ColorConstanse.white),
          ),
        ),
      ),
      body: Column(
          children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorConstanse.mainblack,
                borderRadius: BorderRadius.circular(10)),
            height: 100,
            width: 400,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage("")),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  height: 100,
                  width: 100),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "detail",
                        style: TextStyle(color: ColorConstanse.white),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Text(
                    "price",
                    style: TextStyle(color: ColorConstanse.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 90,
                        ),
                        Container(
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstanse.blue),
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Text(
                          "1",
                          style: TextStyle(color: ColorConstanse.white),
                        ),
                        Container(
                          child: Icon(
                            Icons.remove,
                            size: 20,
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstanse.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      )

          // SizedBox(
          //   height: 20,
          // ),

          ),
    );
  }
}
