import 'package:facebook_clone_app/core/models/user_model.dart';
import 'package:flutter/material.dart';

class DataModelProvider with ChangeNotifier {
  UserModel _userModel = UserModel(
      uid: "",
      email: "",
      phoneNumber: "",
      firstName: "",
      lastName: "",
      profilePicture: "assets/images/dingodile.jpg",
      gender: "");

  UserModel get userModel => _userModel;

  void setDataModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
