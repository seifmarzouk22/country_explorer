import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryCard({
    super.key,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(country.flag, height: 60),
            const SizedBox(height: 10),
            Text(country.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(country.capital),
          ],
        ),
      ),
    );
  }
}
