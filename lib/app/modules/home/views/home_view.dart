import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../widgets/glass_widgets.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/values/app_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildBody(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          // Top Bar
          Row(
            children: [
              // App Logo
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.palette,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              
              // Welcome Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back! 👋',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Dream Art AI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Notification Button
              GlassContainer(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Search Bar
          GlassContainer(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              controller: controller.searchController,
              onChanged: controller.onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search prompts, styles, artists...',
                hintStyle: TextStyle(color: Colors.white60),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white60),
                suffixIcon: Obx(() => controller.isSearching.value
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.white60),
                        onPressed: () {
                          controller.searchController.clear();
                          controller.onSearchChanged('');
                        },
                      )
                    : const SizedBox()),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickActions(),
          const SizedBox(height: 32),
          _buildFeaturedSection(),
          const SizedBox(height: 32),
          _buildTrendingPrompts(),
          const SizedBox(height: 32),
          _buildRecentCreations(),
          const SizedBox(height: 100), // Bottom padding for nav bar
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildActionCard(
                  'Generate Art',
                  Icons.auto_awesome,
                  AppTheme.primaryGradient,
                  () => controller.navigateToGenerate(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionCard(
                  'Explore Gallery',
                  Icons.explore,
                  AppTheme.secondaryGradient,
                  () => controller.navigateToGallery(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, LinearGradient gradient, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              top: -10,
              child: Icon(
                icon,
                size: 80,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Artworks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: controller.navigateToGallery,
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.featuredArtworks.length,
              itemBuilder: (context, index) {
                final artwork = controller.featuredArtworks[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: _buildArtworkCard(artwork, index == 0),
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

  Widget _buildArtworkCard(artwork, bool isFirst) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: isFirst ? 0 : 12),
      child: GlassContainer(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(artwork.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              artwork.style,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${artwork.likes} likes',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingPrompts() {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Prompts 🔥',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() => Column(
            children: controller.trendingPrompts.asMap().entries.map((entry) {
              final index = entry.key;
              final prompt = entry.value;
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildPromptCard(prompt),
                  ),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }

  Widget _buildPromptCard(String prompt) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
              child: const Icon(
                Icons.lightbulb_outline,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                prompt,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white60,
                size: 16,
              ),
              onPressed: () => controller.onPromptTap(prompt),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentCreations() {
    return FadeInUp(
      delay: const Duration(milliseconds: 600),
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Creations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: controller.navigateToLibrary,
                child: Text(
                  'View Library',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.recentArtworks.length,
              itemBuilder: (context, index) {
                final artwork = controller.recentArtworks[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: _buildRecentArtworkCard(artwork, index == 0),
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

  Widget _buildRecentArtworkCard(artwork, bool isFirst) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(left: isFirst ? 0 : 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: CachedNetworkImageProvider(artwork.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GlassContainer(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Obx(() => BottomNavigationBar(
          currentIndex: controller.currentTabIndex.value,
          onTap: controller.onTabChanged,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.white60,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_outlined),
              activeIcon: Icon(Icons.auto_awesome),
              label: 'Generate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              activeIcon: Icon(Icons.bookmark),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        )),
      ),
    );
  }
}