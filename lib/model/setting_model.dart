import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  List<String> countries = ['India','USA', 'Canada', 'UK', 'Australia','Russia'];

  void addCountry(String country) {
    countries.add(country);
    notifyListeners();
  }
}
