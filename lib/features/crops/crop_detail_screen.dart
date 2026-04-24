import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/crop_model.dart';

class CropDetailScreen extends StatelessWidget {
  CropDetailScreen({super.key});

  final CropModel crop = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crop.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🌄 IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              child: Image.network(
                crop.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🌾 Name
                  Text(
                    crop.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    crop.nameHindi,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 📄 Description
                  Text(
                    crop.description,
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 16),

                  // 📊 DETAILS CARD
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          buildRow("Season", crop.season.join(", ")),
                          buildRow("Soil", crop.soilType.join(", ")),
                          buildRow("Water", crop.waterRequirement),
                          buildRow("Temperature", crop.temperatureRange),
                          buildRow("Duration", "${crop.growthDurationDays} days"),
                          buildRow("Fertilizer", crop.fertilizer),
                          buildRow("Region", crop.region.join(", ")),
                          buildRow("Price", "₹${crop.pricePerQuintal} / quintal"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 reusable row widget
  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}