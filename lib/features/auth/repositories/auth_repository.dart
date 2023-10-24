import 'package:facebook_clone_app/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutheRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserModel?> signInWithEmailAndPassword(
      String lastName,
      String firstName,
      String gender,
      String email,
      String profilePicture,
      String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
          uid: userCredential.user!.uid,
          email: email,
          phoneNumber: lastName,
          firstName: firstName,
          lastName: lastName,
          profilePicture: profilePicture,
          gender: gender);
      return userModel;
    } catch (e) {
      print("Error in signInWithEmailAndPassword: $e");
      return null;
    }
  }
}
