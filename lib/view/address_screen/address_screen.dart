import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: ColorConstanse.grey)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: ColorConstanse.grey)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  height: 80,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Pincode",
                        labelStyle: TextStyle(color: ColorConstanse.grey)),
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 80,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "City",
                        labelStyle: TextStyle(color: ColorConstanse.grey)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "House no ,Building Name",
                  labelStyle: TextStyle(color: ColorConstanse.grey)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Road name,Area,Colony",
                  labelStyle: TextStyle(color: ColorConstanse.grey)),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Type of adress"),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: ColorConstanse.LIGHTGREY,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Work",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: ColorConstanse.LIGHTGREY,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Payment",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstanse.blue,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
