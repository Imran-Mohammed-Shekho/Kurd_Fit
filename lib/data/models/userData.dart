import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  // String password;

  UserModel(this.email, this.name);

  // 🔹 Convert Firestore document to UserModel
  factory UserModel.fromSnap(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return UserModel(
      data['email'] ?? '',
      data['name'] ?? '',
      // data['password'] ?? '',
    );
  }

  // 🔹 Convert UserModel to Firestore document (Map)
  Map<String, dynamic> toSnap() {
    return {'name': name, 'email': email};
  }
}
