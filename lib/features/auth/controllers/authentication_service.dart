import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facebook_clone_app/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef AuthResult<T> = Either<AuthFailure, T>;

class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthService(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<Either<AuthFailure, UserModel>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String profilePicture,
    String gender,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel? userModel = UserModel(
          uid: userCredential.user!.uid,
          email: email,
          phoneNumber: "",
          firstName: firstName,
          lastName: lastName,
          profilePicture: profilePicture,
          gender: gender);

      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(AuthFailure("Email is already in use"));
      } else {
        return left(AuthFailure("An error occurred: ${e.message}"));
      }
    }
  }

  Future<AuthResult<UserCredential>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return left(AuthFailure("Wrong password"));
      } else if (e.code == 'user-not-found') {
        return left(AuthFailure("User not found for that email"));
      } else if (e.code == 'user-disabled') {
        return left(AuthFailure("User account is disabled"));
      } else if (e.code == 'invalid-email') {
        return left(AuthFailure("Invalid email address"));
      } else {
        return left(AuthFailure("An error occurred: ${e.message}"));
      }
    } catch (e) {
      return left(AuthFailure("An unexpected error occurred: $e"));
    }
  }
}

// Define AuthFailure class
class AuthFailure {
  final String message;

  AuthFailure(this.message);

  @override
  String toString() {
    return message;
  }
}

class AuthSucceed {
  final String message;

  AuthSucceed(this.message);

  @override
  String toString() {
    return message;
  }
}
