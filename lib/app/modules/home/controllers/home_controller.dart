import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dummy_data.dart';
import '../../../data/models/artwork_model.dart';
import '../../generate/views/generate_view.dart';
import '../../gallery/views/gallery_view.dart';
import '../../library/views/library_view.dart';
import '../../profile/views/profile_view.dart';

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
        Get.to(() => const GenerateView());
        break;
      case 2:
        Get.to(() => const GalleryView());
        break;
      case 3:
        Get.to(() => const LibraryView());
        break;
      case 4:
        Get.to(() => const ProfileView());
        break;
    }
  }

  void navigateToGenerate() {
    Get.to(() => const GenerateView());
  }

  void navigateToGallery() {
    Get.to(() => const GalleryView());
  }

  void navigateToLibrary() {
    Get.to(() => const LibraryView());
  }  void onSearchChanged(String query) {
    isSearching.value = query.isNotEmpty;
  }

  void onPromptTap(String prompt) {
    Get.to(() => const GenerateView(), arguments: {'prompt': prompt});
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
