// presentation/provider/date_picker_provider.dart
import 'package:facebook_clone_app/features/auth/repositories/date_picker_data.dart';
import 'package:flutter/material.dart';

class DatePickerProvider with ChangeNotifier {
  final DatePickerService _datePickerService = DatePickerService();
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  Future<void> pickDate(BuildContext context) async {
    final pickedDate =
        await _datePickerService.pickDate(context, _selectedDate);
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      notifyListeners();
    }
  }

  bool validateDate() {
    // TODO:                                    ADD MORE LOGIC
    return _selectedDate.isBefore(DateTime.now());
  }

  bool _showDate = false;

  get showDate => _showDate;

  void setDateValidation(bool newShow) {
    _showDate = newShow;
    notifyListeners();
  }
}
