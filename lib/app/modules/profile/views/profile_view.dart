import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../widgets/glass_widgets.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/values/app_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAppBar(),
                _buildProfileHeader(),
                const SizedBox(height: 32),
                _buildStatsRow(),
                const SizedBox(height: 32),
                _buildRecentArtworks(),
                const SizedBox(height: 32),
                _buildMenuItems(),
                const SizedBox(height: 50),
              ],
            ),
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
          const Spacer(),
          Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          GlassContainer(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Obx(() {
      final profile = controller.userProfile;
      return FadeInUp(
        child: Column(
          children: [
            // Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: profile['avatar'] ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, size: 60),
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Name
            Text(
              profile['name'] ?? 'User Name',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Bio
            Text(
              profile['bio'] ?? 'Digital artist passionate about AI-generated art',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 16),
            
            // Edit Profile Button
            GradientButton(
              text: 'Edit Profile',
              onPressed: controller.editProfile,
              width: 150,
              height: 40,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildStatsRow() {
    return Obx(() {
      final profile = controller.userProfile;
      return FadeInUp(
        delay: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
          child: Row(
            children: [
              _buildStatCard('Artworks', '${profile['artworksCreated'] ?? 0}'),
              const SizedBox(width: 12),
              _buildStatCard('Favorites', '${profile['favoriteCount'] ?? 0}'),
              const SizedBox(width: 12),
              _buildStatCard('Followers', '${profile['followersCount'] ?? 0}'),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: GlassContainer(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentArtworks() {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
            child: Text(
              'Recent Artworks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
              itemCount: controller.recentArtworks.length,
              itemBuilder: (context, index) {
                final artwork = controller.recentArtworks[index];
                return Container(
                  width: 120,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(artwork.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return FadeInUp(
      delay: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          children: [
            _buildMenuItem(Icons.palette, 'My Artworks', () {}),
            _buildMenuItem(Icons.favorite, 'Favorites', () {}),
            _buildMenuItem(Icons.share, 'Share Profile', () {}),
            _buildMenuItem(Icons.star, 'Upgrade to Premium', () {}),
            _buildMenuItem(Icons.settings, 'Settings', controller.navigateToSettings),
            _buildMenuItem(Icons.help, 'Help & Support', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
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
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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