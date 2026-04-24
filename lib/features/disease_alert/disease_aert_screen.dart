import 'package:flutter/material.dart';

class DiseaseAlertScreen extends StatefulWidget {
  const DiseaseAlertScreen({super.key});

  @override
  State<DiseaseAlertScreen> createState() => _DiseaseAlertScreenState();
}

class _DiseaseAlertScreenState extends State<DiseaseAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: const Text("🦠 Disease & Pests")),
      body: const Center(
        child: Text("Disease & Pest Info Screen"),
      ),
    );
  }
}