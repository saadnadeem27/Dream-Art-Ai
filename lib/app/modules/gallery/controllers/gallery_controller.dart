import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/artwork_model.dart';
import '../../../data/dummy_data.dart';

class GalleryController extends GetxController {
  final searchController = TextEditingController();
  final artworks = <ArtworkModel>[].obs;
  final filteredArtworks = <ArtworkModel>[].obs;
  final isLoading = false.obs;
  final selectedCategory = 'All'.obs;

  final categories = ['All', 'Featured', 'Trending', 'Recent', 'Popular'].obs;

  @override
  void onInit() {
    super.onInit();
    loadArtworks();
  }

  void loadArtworks() {
    isLoading.value = true;

    // Simulate loading
    Future.delayed(const Duration(seconds: 1), () {
      artworks.value = List.from(DummyData.galleryArtworks);
      artworks.addAll(DummyData.myLibrary);

      filteredArtworks.value = artworks;
      isLoading.value = false;
    });
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      filteredArtworks.value = artworks;
    } else {
      filteredArtworks.value = artworks.where((artwork) {
        return artwork.prompt.toLowerCase().contains(query.toLowerCase()) ||
            artwork.style.toLowerCase().contains(query.toLowerCase()) ||
            artwork.tags
                .any((tag) => tag.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;

    switch (category) {
      case 'All':
        filteredArtworks.value = artworks;
        break;
      case 'Featured':
        filteredArtworks.value =
            artworks.where((art) => art.likes > 100).toList();
        break;
      case 'Trending':
        filteredArtworks.value =
            artworks.where((art) => art.likes > 50).toList();
        break;
      case 'Recent':
        filteredArtworks.value = artworks
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'Popular':
        filteredArtworks.value = artworks
          ..sort((a, b) => b.likes.compareTo(a.likes));
        break;
    }
  }

  void toggleLike(ArtworkModel artwork) {
    final index = artworks.indexWhere((art) => art.id == artwork.id);
    if (index != -1) {
      final updatedArtwork = artwork.copyWith(
        isFavorite: !artwork.isFavorite,
        likes: artwork.isFavorite ? artwork.likes - 1 : artwork.likes + 1,
      );
      artworks[index] = updatedArtwork;

      // Update filtered list too
      final filteredIndex =
          filteredArtworks.indexWhere((art) => art.id == artwork.id);
      if (filteredIndex != -1) {
        filteredArtworks[filteredIndex] = updatedArtwork;
      }
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
