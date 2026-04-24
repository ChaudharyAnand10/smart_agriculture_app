import 'package:agro_app/controllers/crop_controller.dart';
import 'package:agro_app/features/crops/crop_detail_screen.dart';
import 'package:agro_app/features/disease_alert/disease_aert_screen.dart';
import 'package:agro_app/features/firtilizer/firtilizer_screen.dart';
import 'package:agro_app/features/home/wigets/action_card.dart';
import 'package:agro_app/features/home/wigets/crausel_widgets.dart';
import 'package:agro_app/features/market/market_screen.dart';
import 'package:agro_app/features/wheather/wheather_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    final CropController controller = Get.put(CropController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("🌱 AgrowWithMe"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🎞 Carousel
            SizedBox(height: 32,),
            CarouselWidget(),

            const SizedBox(height: 10),

            // 🌦 Weather
            ActionCard(
  icon: Icons.eco,
  title: "Fertilizers",
  subtitle: "Check best fertilizers",
  color: Colors.green,
  onTap: () {
    Get.to(() => const FertilizerScreen());
  },
),


ActionCard(
  icon: Icons.store,
  title: "Market Prices",
  subtitle: "Check latest mandi rates",
  color: Colors.orange,
  onTap: () {
    Get.to(() =>  MarketScreen());
  },
),


ActionCard(
  icon: Icons.cloud,
  title: "Weather",
  subtitle: "Check weather updates",
  color: Colors.blue,
  onTap: () {
    Get.to(() =>  WeatherScreen());
  },
),

ActionCard(
  icon: Icons.bug_report,
  title: "Disease & Pests",
  subtitle: "Some Common disease",
  color: Colors.red,
  onTap: () {
    Get.to(() => const DiseaseAlertScreen());
  },
),

            const SizedBox(height: 10),

            // 🌾 Crops Preview
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Popular Crops",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

            

                  Obx(() {
  final crops = controller.crops.take(8).toList(); // 👈 only 8 items

  if (crops.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }

  return SizedBox(
    height: 120,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: crops.length,
      itemBuilder: (context, index) {
        final crop = crops[index];

        return GestureDetector(
          onTap: () {
  Get.to(() => CropDetailScreen(),arguments: crop);
},
          child: Container(
            
          
          
          
          
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    crop.imageUrl, // 👈 Firestore field
                    height: 80,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, size: 50),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  crop.name,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
})
               
               
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}