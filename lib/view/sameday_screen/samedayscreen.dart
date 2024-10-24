import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';

class samedayscreen extends StatefulWidget {
  const samedayscreen({super.key});

  @override
  State<samedayscreen> createState() => _samedayscreenState();
}

class _samedayscreenState extends State<samedayscreen> {
  @override
  Widget build(BuildContext context) {
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 280,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text("data")],
                          ),
                          padding: EdgeInsets.all(10),
                          height: 260,
                          width: 300,
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
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            height: 200,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
