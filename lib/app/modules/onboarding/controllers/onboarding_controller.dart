import 'package:get/get.dart';
import '../../home/views/home_view.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;

  final onboardingData = [
    {
      'title': 'Create Stunning AI Art',
      'description':
          'Transform your imagination into beautiful artworks with the power of artificial intelligence',
      'icon': '🎨',
    },
    {
      'title': 'Multiple Art Styles',
      'description':
          'Choose from various artistic styles including realistic, anime, watercolor, and abstract',
      'icon': '🖼️',
    },
    {
      'title': 'Share Your Creations',
      'description':
          'Join our community of artists and share your AI-generated masterpieces with the world',
      'icon': '🌟',
    },
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      currentPage.value++;
    } else {
      Get.off(() => const HomeView());
    }
  }

  void skipOnboarding() {
    Get.off(() => const HomeView());
  }
}
