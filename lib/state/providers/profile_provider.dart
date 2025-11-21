import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym/data/models/userData.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoad = true;
  UserModel? userModel;
  String name = '';

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection("users");

  Future<UserModel?> getUserDataFromFirestore(String id) async {
    try {
      DocumentSnapshot snap = await _collectionReference.doc(id).get();

      if (snap.exists) {
        userModel = UserModel.fromSnap(snap);
        isLoad = false;
        name = userModel!.name;
        notifyListeners();
      } else {
        return null;
      }
    } catch (e) {
      print("$e :flag");
    }
    return userModel;
  }
}
