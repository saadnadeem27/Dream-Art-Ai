import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dummy_data.dart';
import '../../../data/models/artwork_model.dart';
import 'main_controller.dart';

class HomeController extends GetxController {
  final currentTabIndex = 0.obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;

  final featuredArtworks = <ArtworkModel>[].obs;
  final trendingPrompts = <String>[].obs;
  final recentArtworks = <ArtworkModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  void loadHomeData() {
    // Load dummy data
    featuredArtworks.value = DummyData.galleryArtworks.take(4).toList();
    trendingPrompts.value = DummyData.trendingPrompts.take(5).toList();
    recentArtworks.value = DummyData.myLibrary;
  }

  void navigateToGenerate() {
    Get.find<MainController>().navigateToTab(1);
  }

  void navigateToGallery() {
    Get.find<MainController>().navigateToTab(2);
  }

  void navigateToLibrary() {
    Get.find<MainController>().navigateToTab(3);
  }

  void onSearchChanged(String query) {
    isSearching.value = query.isNotEmpty;
  }

  void onPromptTap(String prompt) {
    Get.find<MainController>().navigateToTab(1);
    // TODO: Pass prompt to generate controller
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
