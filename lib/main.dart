import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/country_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountryProvider()),
      ],
      child: const CountryExplorer(),
    ),
  );
}

class CountryExplorer extends StatelessWidget {
  const CountryExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Country Explorer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
