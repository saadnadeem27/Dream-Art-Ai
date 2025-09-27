import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/style_model.dart';
import '../../../data/models/artwork_model.dart';
import '../../../core/values/app_constants.dart';
import '../../../data/dummy_data.dart';

class GenerateController extends GetxController {
  final promptController = TextEditingController();
  final isGenerating = false.obs;
  final selectedStyle = Rx<StyleModel?>(null);
  final selectedAspectRatio = 0.obs;
  final generationProgress = 0.0.obs;

  final styles = <StyleModel>[].obs;
  final recentPrompts = <String>[].obs;
  final generatedArtworks = <ArtworkModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();

    // Check if prompt was passed from another screen
    if (Get.arguments != null && Get.arguments['prompt'] != null) {
      promptController.text = Get.arguments['prompt'];
    }
  }

  void loadData() {
    styles.value = StyleData.allStyles;
    selectedStyle.value = styles.first;
    recentPrompts.value = DummyData.recentPrompts;
  }

  void selectStyle(StyleModel style) {
    selectedStyle.value = style;
  }

  void selectAspectRatio(int index) {
    selectedAspectRatio.value = index;
  }

  void onPromptChanged(String value) {
    // Auto-save recent prompts
  }

  void useRecentPrompt(String prompt) {
    promptController.text = prompt;
  }

  Future<void> generateArtwork() async {
    if (promptController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a prompt to generate artwork',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    if (selectedStyle.value == null) {
      Get.snackbar(
        'Error',
        'Please select an art style',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    isGenerating.value = true;
    generationProgress.value = 0.0;

    // Simulate generation process
    for (int i = 0; i <= 100; i += 5) {
      await Future.delayed(const Duration(milliseconds: 100));
      generationProgress.value = i / 100;
    }

    // Create a new artwork with dummy data
    final aspectRatio = AppConstants.aspectRatios[selectedAspectRatio.value];
    final newArtwork = ArtworkModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      prompt: promptController.text,
      imageUrl:
          'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800',
      style: selectedStyle.value!.name,
      createdAt: DateTime.now(),
      width: aspectRatio['width'],
      height: aspectRatio['height'],
      userId: 'currentUser',
    );

    generatedArtworks.insert(0, newArtwork);
    isGenerating.value = false;
    generationProgress.value = 0.0;

    // Add to recent prompts
    if (!recentPrompts.contains(promptController.text)) {
      recentPrompts.insert(0, promptController.text);
      if (recentPrompts.length > 10) {
        recentPrompts.removeLast();
      }
    }

    Get.snackbar(
      'Success! 🎨',
      'Your artwork has been generated',
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );
  }

  void saveArtwork(ArtworkModel artwork) {
    Get.snackbar(
      'Saved! 💾',
      'Artwork saved to your library',
      backgroundColor: Colors.blue.withOpacity(0.1),
      colorText: Colors.blue,
    );
  }

  void shareArtwork(ArtworkModel artwork) {
    Get.snackbar(
      'Shared! 📤',
      'Artwork shared successfully',
      backgroundColor: Colors.purple.withOpacity(0.1),
      colorText: Colors.purple,
    );
  }

  @override
  void onClose() {
    promptController.dispose();
    super.onClose();
  }
}
