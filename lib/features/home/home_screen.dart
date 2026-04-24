import 'package:agro_app/features/disease/disease_screen.dart';
import 'package:agro_app/features/firtilizer/firtilizer_screen.dart';
import 'package:agro_app/features/home/wigets/action_card.dart';
import 'package:agro_app/features/home/wigets/crausel_widgets.dart';
import 'package:agro_app/features/market/market_screen.dart';
import 'package:agro_app/features/wheather/wheather_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> sampleCrops = [
    {
      "name": "Wheat",
      "image": "https://picsum.photos/200?1"
    },
    {
      "name": "Rice",
      "image": "https://picsum.photos/200?2"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🌱 GrowWithMe"),
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
  subtitle: "Identify crop problems",
  color: Colors.red,
  onTap: () {
    Get.to(() => const DiseaseScreen());
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

                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sampleCrops.length,
                      itemBuilder: (context, index) {
                        final crop = sampleCrops[index];

                        return Container(
                          width: 100,
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  crop['image']!,
                                  height: 80,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(crop['name']!)
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}