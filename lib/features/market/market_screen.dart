import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'market_controller.dart';
import 'widgets/market_card.dart';

class MarketScreen extends StatelessWidget {
  MarketScreen({super.key});

  final controller = Get.put(MarketController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("📊 Market Prices")),

      body: Column(
        children: [
          // 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search district (e.g. Maharajganj)",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.fetchMarket(
                      search: searchController.text.trim(),
                    );
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // 📋 LIST
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.marketList.isEmpty) {
                return const Center(child: Text("No Data"));
              }

              return ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.marketList.length + 1,
                itemBuilder: (context, index) {
                  if (index < controller.marketList.length) {
                    return MarketCard(
                      data: controller.marketList[index],
                    );
                  } else {
                    return Obx(() => controller.isMoreLoading.value
                        ? const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox());
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}