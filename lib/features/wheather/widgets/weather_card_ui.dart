import 'package:agro_app/features/wheather/wheather_model.dart';
import 'package:agro_app/features/wheather/widgets/wheather_info_tile.dart';
import 'package:flutter/material.dart';

class WeatherCardUI extends StatelessWidget {
  final WeatherModel data;

  const WeatherCardUI({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 380,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          /// 📍 CITY
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              const SizedBox(width: 5),
              Text(
                data.city,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          /// 🌡 TEMPERATURE
          Text(
            "${data.temp.toStringAsFixed(1)}°C",
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          /// ☁ CONDITION
          Text(
            data.condition,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 25),

          /// 📊 INFO BOX
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherInfoTile(
                  icon: Icons.water_drop,
                  title: "Humidity",
                  value: "${data.humidity}%",
                ),
                _divider(),
                WeatherInfoTile(
                  icon: Icons.air,
                  title: "Wind",
                  value: "${data.wind} m/s",
                ),
                _divider(),
                WeatherInfoTile(
                  icon: Icons.thermostat,
                  title: "Feels",
                  value: "${data.temp.toInt()}°",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white30,
    );
  }
}