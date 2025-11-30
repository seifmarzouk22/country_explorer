import 'package:flutter/material.dart';
import '../models/country.dart';
import '../services/country_service.dart';

class CountryProvider extends ChangeNotifier {
  final CountryService _countryService = CountryService();

  List<Country> _countries = [];
  List<Country> _filteredCountries = [];

  bool _isLoading = false;
  String _errorMessage = '';

  // GETTERS
  List<Country> get countries => _countries;
  List<Country> get filteredCountries => _filteredCountries;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // FETCH COUNTRIES
  Future<void> fetchCountries() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _countries = await _countryService.fetchCountries();

      // Initialize filtered list (for search)
      _filteredCountries = _countries;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load countries';
      notifyListeners();
    }
  }

  // 🔍 SEARCH FUNCTION
  void search(String query) {
    if (query.isEmpty) {
      _filteredCountries = _countries;
    } else {
      _filteredCountries = _countries.where((c) {
        final name = c.name.toLowerCase();
        final capital = c.capital.toLowerCase();
        final q = query.toLowerCase();

        return name.contains(q) || capital.contains(q);
      }).toList();
    }
    notifyListeners();
  }
}
