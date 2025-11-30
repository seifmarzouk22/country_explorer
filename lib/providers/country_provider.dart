import 'package:flutter/material.dart';
import '../models/country.dart';
import '../services/country_service.dart';

class CountryProvider extends ChangeNotifier {
  final CountryService _service = CountryService();

  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  bool isLoading = false;
  String? errorMessage;
  String _searchQuery = "";

  // GETTER used by the UI
  List<Country> get countries => _filteredCountries;

  // LOAD COUNTRIES
  Future<void> loadCountries() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      _allCountries = await _service.fetchCountries();
      _applyFilter();
    } catch (e) {
      errorMessage = "Failed to load countries";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // SEARCH FUNCTION
  void updateSearch(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilter();
  }

  // INTERNAL FILTER FUNCTION
  void _applyFilter() {
    if (_searchQuery.isEmpty) {
      _filteredCountries = _allCountries;
    } else {
      _filteredCountries = _allCountries
          .where((c) => c.name.toLowerCase().contains(_searchQuery))
          .toList();
    }
    notifyListeners();
  }
}
