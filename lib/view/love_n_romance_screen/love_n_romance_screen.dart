import 'package:flutter/material.dart';
import 'package:mainpro2/view/fav_screen/fav_screen.dart';

class LoveNRomanceScreen extends StatelessWidget {
  const LoveNRomanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600, // Adjust the height as needed
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 280,
              crossAxisCount: 2),
          itemCount: 6,
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavScreen(),
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      height: 200,
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ])),
    );
  }
}
