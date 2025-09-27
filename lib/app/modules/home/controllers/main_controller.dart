import 'package:get/get.dart';

class MainController extends GetxController {
  final currentTabIndex = 0.obs;

  void onTabChanged(int index) {
    currentTabIndex.value = index;
  }

  void navigateToTab(int index) {
    currentTabIndex.value = index;
  }
}