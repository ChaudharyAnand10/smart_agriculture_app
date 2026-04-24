import 'package:agro_app/features/firtilizer/firtilizer_model.dart';
import 'package:flutter/material.dart';

class FertilizerCard extends StatelessWidget {
  final FertilizerModel data;

  const FertilizerCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text("Composition: ${data.composition}"),

            const SizedBox(height: 5),

            Text("Best for: ${data.suitableCrops.join(", ")}"),

            const SizedBox(height: 5),

            Text(
              data.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}