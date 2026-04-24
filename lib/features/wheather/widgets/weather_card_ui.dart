import 'package:agro_app/features/wheather/wheather_model.dart';
import 'package:flutter/material.dart';

class WeatherCardUI extends StatelessWidget {
  final WeatherModel data;

  const WeatherCardUI({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              data.city,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${data.temp}°C",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              data.condition,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.water_drop),
                    Text("${data.humidity}%"),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.air),
                    Text("${data.wind} m/s"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}