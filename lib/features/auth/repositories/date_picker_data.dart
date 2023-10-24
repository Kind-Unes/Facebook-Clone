// domain/service/date_picker_service.dart
import 'package:flutter/material.dart';

class DatePickerService {
  Future<DateTime?> pickDate(BuildContext context, DateTime initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1910),
      lastDate: DateTime(2024),
    );
  }
}
