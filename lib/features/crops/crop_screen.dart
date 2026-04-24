import 'package:agro_app/features/crops/crop_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/crop_controller.dart';

class CropScreen extends StatelessWidget {
  CropScreen({super.key});

  final CropController controller = Get.put(CropController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🌾 Crops"), centerTitle: true),

      body: Column(
        children: [
          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: controller.searchCrop,
              decoration: InputDecoration(
                hintText: "Search crop...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // 📋 LIST
          Expanded(
            child: Obx(() {
              final crops = controller.filteredCrops;

              if (crops.isEmpty) {
                return const Center(child: Text("No crops found"));
              }

              return ListView.builder(
                itemCount: crops.length,
                itemBuilder: (context, index) {
                  final crop = crops[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Get.to(() => CropDetailScreen(), arguments: crop);
                      },
                      title: Text(
                        crop.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(crop.nameHindi),

                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            crop.season.join(", "),
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            crop.waterRequirement,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
