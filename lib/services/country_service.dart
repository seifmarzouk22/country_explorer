import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/country.dart';

class CountryService {
  final String baseUrl = "https://restcountries.com/v3.1";

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/all?fields=name,capital,flags"),
      );

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((json) => Country.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load countries");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
