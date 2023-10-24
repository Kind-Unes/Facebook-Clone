import 'package:flutter/material.dart';

class TabSelectionModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setTabIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
