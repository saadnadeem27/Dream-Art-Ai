import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/artwork_model.dart';
import '../../../data/dummy_data.dart';

class LibraryController extends GetxController {
  final myArtworks = <ArtworkModel>[].obs;
  final favorites = <ArtworkModel>[].obs;
  final selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadLibraryData();
  }

  void loadLibraryData() {
    myArtworks.value = DummyData.myLibrary;
    favorites.value = DummyData.galleryArtworks;
  }

  void selectTab(int index) {
    selectedTab.value = index;
  }

  void toggleFavorite(ArtworkModel artwork) {
    final index = myArtworks.indexWhere((art) => art.id == artwork.id);
    if (index != -1) {
      final updatedArtwork = artwork.copyWith(isFavorite: !artwork.isFavorite);
      myArtworks[index] = updatedArtwork;

      if (updatedArtwork.isFavorite) {
        favorites.add(updatedArtwork);
      } else {
        favorites.removeWhere((art) => art.id == artwork.id);
      }
    }
  }

  void deleteArtwork(ArtworkModel artwork) {
    myArtworks.removeWhere((art) => art.id == artwork.id);
    favorites.removeWhere((art) => art.id == artwork.id);

    Get.snackbar(
      'Deleted',
      'Artwork removed from library',
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
    );
  }
}
