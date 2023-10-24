import 'package:flutter/material.dart';

class ErrorMessagesProvider with ChangeNotifier {
  String _errorMessage = '';

  String get errormMessage => _errorMessage;

  void setErrorMessage(String newText) {
    _errorMessage = newText;
    notifyListeners();
  }
}
