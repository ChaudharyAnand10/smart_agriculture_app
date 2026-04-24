import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🌦 Weather"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🌍 Location
            const Text(
              "Babhnauli, UP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🌡 Temperature Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Icon(Icons.wb_sunny, size: 50, color: Colors.orange),
                    SizedBox(height: 10),
                    Text(
                      "30°C",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Sunny"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📊 Extra Info
            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.water_drop),
                    title: Text("Humidity"),
                    trailing: Text("60%"),
                  ),
                  ListTile(
                    leading: Icon(Icons.air),
                    title: Text("Wind Speed"),
                    trailing: Text("12 km/h"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}