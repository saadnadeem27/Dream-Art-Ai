import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../data/dummy_data.dart';
import '../../../data/models/artwork_model.dart';

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

  void onTabChanged(int index) {
    currentTabIndex.value = index;
    
    switch (index) {
      case 0:
        // Stay on home
        break;
      case 1:
        Get.toNamed(Routes.GENERATE);
        break;
      case 2:
        Get.toNamed(Routes.GALLERY);
        break;
      case 3:
        Get.toNamed(Routes.LIBRARY);
        break;
      case 4:
        Get.toNamed(Routes.PROFILE);
        break;
    }
  }

  void navigateToGenerate() {
    Get.toNamed(Routes.GENERATE);
  }

  void navigateToGallery() {
    Get.toNamed(Routes.GALLERY);
  }

  void navigateToLibrary() {
    Get.toNamed(Routes.LIBRARY);
  }

  void onSearchChanged(String query) {
    isSearching.value = query.isNotEmpty;
  }

  void onPromptTap(String prompt) {
    Get.toNamed(Routes.GENERATE, arguments: {'prompt': prompt});
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}