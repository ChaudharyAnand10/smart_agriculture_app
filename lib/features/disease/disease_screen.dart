import 'package:flutter/material.dart';
import 'disease_service.dart';

class DiseaseScreen extends StatelessWidget {
  const DiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🌿 Disease Detection"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // 🌿 IMAGE
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/2909/2909763.png",
              height: 150,
            ),

            const SizedBox(height: 20),

            // 🧠 TITLE
            const Text(
              "AI Crop Disease Detection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // 📄 DESCRIPTION
            const Text(
              "Upload crop image and our AI model will detect diseases and suggest solutions.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // 🚀 BUTTON
            ElevatedButton.icon(
              onPressed: () {
                DiseaseService.openDiseaseApp();
              },
              icon: const Icon(Icons.upload),
              label: const Text("Upload Image & Detect"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ℹ️ NOTE
            const Text(
              "⚡ Powered by AI Model deployed on Cloud",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}