import 'package:agro_app/features/wheather/wheather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/weather_card_ui.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  final controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🌦 Weather")),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        if (controller.weather.value != null) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: WeatherCardUI(data: controller.weather.value!),
          );
        }

        return const Center(child: Text("No Data"));
      }),
    );
  }
}