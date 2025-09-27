import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../widgets/glass_widgets.dart';
import '../../../core/theme/app_theme.dart';
import '../controllers/main_controller.dart';
import '../../generate/views/generate_view.dart';
import '../../gallery/views/gallery_view.dart';
import '../../library/views/library_view.dart';
import '../../profile/views/profile_view.dart';
import 'home_content_view.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: Obx(() => IndexedStack(
              index: controller.currentTabIndex.value,
              children: [
                HomeContentView(),
                GenerateView(),
                GalleryView(),
                LibraryView(),
                ProfileView(),
              ],
            )),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: FadeInUp(
        delay: const Duration(milliseconds: 200),
        child: GlassContainer(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          borderRadius: BorderRadius.circular(25),
          blur: 20,
          child: Obx(() => BottomNavigationBar(
                currentIndex: controller.currentTabIndex.value,
                onTap: controller.onTabChanged,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: AppTheme.accentColor,
                unselectedItemColor: Colors.white60,
                selectedFontSize: 12,
                unselectedFontSize: 11,
                iconSize: 24,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.auto_awesome_outlined),
                    activeIcon: Icon(Icons.auto_awesome),
                    label: 'Create',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    activeIcon: Icon(Icons.explore),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border_outlined),
                    activeIcon: Icon(Icons.bookmark_rounded),
                    label: 'Library',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    activeIcon: Icon(Icons.person_rounded),
                    label: 'Profile',
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
