import 'package:get/get.dart';

class SettingsController extends GetxController {
  final isDarkMode = true.obs;
  final notificationsEnabled = true.obs;
  final highQualityEnabled = false.obs;

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }

  void toggleNotifications() {
    notificationsEnabled.value = !notificationsEnabled.value;
  }

  void toggleHighQuality() {
    highQualityEnabled.value = !highQualityEnabled.value;
  }
}