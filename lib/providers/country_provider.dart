import 'package:flutter/material.dart';
import '../models/country.dart';
import '../services/country_service.dart';

class CountryProvider with ChangeNotifier {
  final CountryService _service = CountryService();

  List<Country> _countries = [];
  List<Country> get countries => _countries;

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadCountries() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _countries = await _service.fetchCountries();
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
