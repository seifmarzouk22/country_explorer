import 'package:flutter/material.dart';
import '../models/country.dart';

class DetailScreen extends StatefulWidget {
  final Country country;
  const DetailScreen({super.key, required this.country});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.country.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(widget.country.flag, height: 120),
            const SizedBox(height: 20),
            Text(
              "Capital: ${widget.country.capital}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
