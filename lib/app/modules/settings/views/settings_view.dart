import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../widgets/glass_widgets.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/values/app_constants.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: _buildContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 8),
          Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Appearance', [
            _buildSwitchTile(
              'Dark Mode',
              'Use dark theme',
              Icons.dark_mode,
              controller.isDarkMode,
              controller.toggleDarkMode,
            ),
          ]),
          
          const SizedBox(height: 24),
          
          _buildSection('Notifications', [
            _buildSwitchTile(
              'Push Notifications',
              'Receive notifications about new features and updates',
              Icons.notifications,
              controller.notificationsEnabled,
              controller.toggleNotifications,
            ),
          ]),
          
          const SizedBox(height: 24),
          
          _buildSection('Generation', [
            _buildSwitchTile(
              'High Quality Mode',
              'Generate higher quality images (Premium feature)',
              Icons.high_quality,
              controller.highQualityEnabled,
              controller.toggleHighQuality,
            ),
          ]),
          
          const SizedBox(height: 24),
          
          _buildSection('Account', [
            _buildActionTile(
              'Subscription',
              'Manage your premium subscription',
              Icons.star,
              () => Get.snackbar('Coming Soon', 'Subscription management will be available soon'),
            ),
            _buildActionTile(
              'Privacy Policy',
              'View our privacy policy',
              Icons.privacy_tip,
              () => Get.snackbar('Info', 'Privacy policy would open here'),
            ),
            _buildActionTile(
              'Terms of Service',
              'View terms and conditions',
              Icons.description,
              () => Get.snackbar('Info', 'Terms of service would open here'),
            ),
          ]),
          
          const SizedBox(height: 24),
          
          _buildSection('Support', [
            _buildActionTile(
              'Help Center',
              'Get help and support',
              Icons.help,
              () => Get.snackbar('Support', 'Help center would open here'),
            ),
            _buildActionTile(
              'Contact Us',
              'Send us feedback or report issues',
              Icons.email,
              () => Get.snackbar('Contact', 'Contact form would open here'),
            ),
            _buildActionTile(
              'About',
              'App version and information',
              Icons.info,
              () => Get.snackbar('Dream Art AI', 'Version 1.0.0\nBuilt with Flutter & AI'),
            ),
          ]),
          
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return FadeInUp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    IconData icon,
    RxBool value,
    VoidCallback onToggle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GlassContainer(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => Switch(
              value: value.value,
              onChanged: (v) => onToggle(),
              activeColor: AppTheme.primaryColor,
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: GlassContainer(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white60,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}