import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mainpro2/utils/constants/color_constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, required this.totalamount});
  final num totalamount;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController House = TextEditingController();
  TextEditingController Road = TextEditingController();
  final formkey = GlobalKey<FormState>();
  var address = FirebaseFirestore.instance.collection('Address');
  //step1- local variable and fntn created
  late Razorpay _razorpay;
  void _paymentSuccess(PaymentSuccessResponse response) {
    //toast
    print("success $response");
  }

  void _paymentFaliure(PaymentSuccessResponse response) {
    print("Faliure $response");
  }

  void _paymentWallet(ExternalWalletResponse response) {}
//step2 -funcn to work with razorpays event
  @override
  void initState() {
    super.initState(); //object initialised
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _paymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _paymentFaliure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _paymentWallet);
  }

  //step 3 clear the razorpay object
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void checkout(
    num amt,
    String phone,
  ) {
    var options = {
      //dynamic key of client please replace key with your key
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      //amt in pisa to rupees
      'amount': amt * 100,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '$phone',
      },
      'external': {
        'wallets': ['paytm', 'gpay']
      }
    };
    try {
      _razorpay.open(options); //razorpay starts using open()fctn
    } catch (e) {}
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
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
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    } else {
                      return null;
                    }
                  },
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
                  controller: phone,
                  validator: (value) {
                    if (value != null && value.length == 10) {
                      return null;
                    } else {
                      return "enter valid phone number";
                    }
                  },
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
                        controller: pin,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter pincode';
                          } else {
                            return null;
                          }
                        },
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
                        controller: city,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter city';
                          } else {
                            return null;
                          }
                        },
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
                  controller: House,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Hno';
                    } else {
                      return null;
                    }
                  },
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
                  controller: Road,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter road';
                    } else {
                      return null;
                    }
                  },
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
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      checkout(widget.totalamount, phone.text);
                      await address.add({
                        "name": name.text,
                        'phone': phone.text,
                        "pin": phone.text,
                        "city": city.text,
                        "house": House.text,
                        "road": Road.text
                      });
                    }
                  },
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
        ),
      ),
    );
  }
}
