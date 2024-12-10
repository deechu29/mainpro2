import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  num totalAmount = 0;
  Future<void> updateTotalAmount(List<QueryDocumentSnapshot> documents) async {
    totalAmount = 0;
    for (var document in documents) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      if (data.isNotEmpty) {
        totalAmount += data['price'] * data['quantity'];
      }
    }
  }

  Future<void> incrementQuantity(String documentId, num currentQty) async {
    num newQty = currentQty + 1;
    await FirebaseFirestore.instance
        .collection("Cartitems")
        .doc(documentId)
        .update({
      "quantity": newQty,
    });
    notifyListeners();
  }

  Future<void> decrementQuantity(String documentId, num currentQty) async {
    if (currentQty >= 2) {
      num newQty = currentQty - 1;
      await FirebaseFirestore.instance
          .collection("Cartitems")
          .doc(documentId)
          .update({
        "quantity": newQty,
      });
      notifyListeners();
    }
  }

  Future<void> removeCartItem(String documentId) async {
    await FirebaseFirestore.instance
        .collection("Cartitems")
        .doc(documentId)
        .delete();
   
  }
}
