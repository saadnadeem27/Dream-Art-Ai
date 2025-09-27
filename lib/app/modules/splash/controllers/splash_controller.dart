import 'package:get/get.dart';
import '../../home/views/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const HomeView()); // Direct navigation to home
    });
  }
}
