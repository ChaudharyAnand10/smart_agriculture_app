import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'market_model.dart';
import 'market_service.dart';

class MarketController extends GetxController {
  var marketList = <MarketModel>[].obs;
  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  var error = "".obs;

  int offset = 0;
  final int limit = 20;

  String currentSearch = "";

  final scrollController = ScrollController();
  final service = MarketService();

  @override
  void onInit() {
    super.onInit();
    fetchMarket();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  Future<void> fetchMarket({String search = ""}) async {
    try {
      isLoading.value = true;
      offset = 0;
      currentSearch = search;

      final data = await service.fetchMarket(
        offset: offset,
        search: search,
      );

      marketList.value = data;
      isLoading.value = false;
    } catch (e) {
      error.value = "Error loading data";
      isLoading.value = false;
    }
  }

  Future<void> loadMore() async {
    try {
      isMoreLoading.value = true;
      offset += limit;

      final data = await service.fetchMarket(
        offset: offset,
        search: currentSearch,
      );

      marketList.addAll(data);
      isMoreLoading.value = false;
    } catch (e) {
      isMoreLoading.value = false;
    }
  }
}