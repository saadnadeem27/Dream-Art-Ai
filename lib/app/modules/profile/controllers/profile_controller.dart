import 'package:get/get.dart';
import '../../../data/dummy_data.dart';
import '../../settings/views/settings_view.dart';

class ProfileController extends GetxController {
  final userProfile = {}.obs;
  final recentArtworks = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
  }

  void loadProfileData() {
    userProfile.value = DummyData.userProfile;
    recentArtworks.value = DummyData.myLibrary.take(6).toList();
  }

  void navigateToSettings() {
    Get.to(() => const SettingsView());
  }

  void editProfile() {
    Get.snackbar(
        'Coming Soon', 'Profile editing will be available in the next update');
  }
}
