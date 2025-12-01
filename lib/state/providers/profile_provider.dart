import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym/data/models/userData.dart';
import 'package:gym/data/models/userInfoModel.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoad = true;
  UserModel? userModel;
  String name = '';
  Userinfomodel? userInfo;

  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection("users");

  final CollectionReference _collectionReferenceUserInformation =
      FirebaseFirestore.instance.collection("userInfo");

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
      print(
        "error , occured while fecthing user info from firestore tag :profile page : error : $e",
      );
    }
    return userModel;
  }

  Future<Userinfomodel?> getUserInfoFromFirestore(String uid) async {
    try {
      DocumentSnapshot snap = await _collectionReferenceUserInformation
          .doc(uid)
          .get();

      if (!snap.exists) return null;

      userInfo = Userinfomodel.fromSnap(snap);
      notifyListeners();
      return userInfo;
    } catch (e) {
      print(
        "error , occured while fecthing user info from firestore tag basic :profile page : error : $e",
      );
      return null;
    }
  }
}
