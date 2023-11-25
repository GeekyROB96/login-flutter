//   import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../features/authentication/models/user_model.dart';
//
// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();
//
//   final _db = FirebaseFirestore.instance;
//
//   Future<void> createUser(UserModel user) async {
//     await _db
//         .collection("Users")
//         .add(user.toJson())
//         .whenComplete(
//           () => Get.snackbar("Success", "Your Account has been Created.",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green.withOpacity(0.1),
//           colorText: Colors.green),
//     )
//         .catchError((error, stackTrace) {
//       Get.snackbar("Error", "Something Went Wrong. Try Again",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.redAccent.withOpacity(0.1),
//           colorText: Colors.red);
//       print(error.toString());
//       print(stackTrace); // Print the stack trace for debugging
//     });
//   }
//
//   Future<UserModel> getUserDetails(String email) async {
//     final snapshot =
//     await _db.collection("Users").where("Email", isEqualTo: email).get();
//
//     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
//     return userData;
//   }
//
//   Future<List<UserModel>> allUser() async {
//     final snapshot = await _db.collection("Users").get();
//     final userData =
//     snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
//     return userData;
//   }
//
//   Future<void> updateUserRecord(UserModel user) async {
//     await _db.collection("Users").doc(user.id.toString()).update(user.toJson());
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  Future<void> createUser(UserModel user) async {
    final uid = _db.collection("Users").doc().id;

    // Add a debug statement to print the user ID
    print('Generated User ID: $uid');

    await _db
        .collection("Users")
        .doc(uid)
        .set({
      'id': uid,
      ...user.toJson(),
    })
        .whenComplete(() {
      Get.snackbar(
        "Success",
        "Your Account has been Created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    })
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something Went Wrong. Try Again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
      print(stackTrace); // Print the stack trace for debugging
    });
  }


  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
    await _db.collection("Users").where("Email", isEqualTo: email).get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
    snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
