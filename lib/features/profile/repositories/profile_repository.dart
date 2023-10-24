import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_app/core/models/user_model.dart';

class ProfileRepository {
  Future<UserModel?> getUserData(String uid) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get();

      if (docSnapshot.exists) {
        return UserModel.fromJson(docSnapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      // Handle exceptions and errors here
      print("Error fetching user data: $e");
      return null;
    }
  }
}
