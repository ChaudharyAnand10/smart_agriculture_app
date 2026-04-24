import 'package:agro_app/features/wheather/wheather_screen.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
  leading: const Icon(Icons.cloud, color: Colors.blue),
  title: const Text("Weather Info"),
  subtitle: const Text("Tap to see details"),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WeatherScreen(),
      ),
    );
  },
),
    );
  }
}