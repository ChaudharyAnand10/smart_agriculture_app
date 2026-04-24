import 'package:agro_app/features/firtilizer/firtilizer_controller.dart';
import 'package:agro_app/features/firtilizer/widgets/firtilizer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FertilizerScreen extends StatelessWidget {
  const FertilizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FertilizerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("🌱 Fertilizers"),
      ),

      body: Obx(() {
        return ListView.builder(
          itemCount: controller.fertilizers.length,
          itemBuilder: (context, index) {
            return FertilizerCard(
              data: controller.fertilizers[index],
            );
          },
        );
      }),
    );
  }
}