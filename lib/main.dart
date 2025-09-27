import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/core/theme/app_theme.dart';
import 'app/modules/splash/views/splash_view.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/generate/controllers/generate_controller.dart';
import 'app/modules/gallery/controllers/gallery_controller.dart';
import 'app/modules/library/controllers/library_controller.dart';
import 'app/modules/profile/controllers/profile_controller.dart';
import 'app/modules/settings/controllers/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const DreamArtAI());
}

class DreamArtAI extends StatelessWidget {
  const DreamArtAI({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize all controllers at startup
    _initializeControllers();
    
    return GetMaterialApp(
      title: 'Dream Art AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashView(),
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  void _initializeControllers() {
    // Initialize all controllers at once to avoid binding issues
    Get.put(HomeController());
    Get.put(GenerateController());
    Get.put(GalleryController());
    Get.put(LibraryController());
    Get.put(ProfileController());
    Get.put(SettingsController());
  }
}
