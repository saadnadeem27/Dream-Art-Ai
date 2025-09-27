class AppConstants {
  // App Info
  static const String appName = 'Dream Art AI';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Create stunning AI-generated artwork with advanced AI models';
  
  // API Configuration
  static const String baseUrl = 'https://api.dreamart.ai';
  static const String apiVersion = 'v1';
  
  // Storage Keys
  static const String userPrefsKey = 'user_preferences';
  static const String artLibraryKey = 'art_library';
  static const String favoritesKey = 'favorites';
  static const String recentPromptsKey = 'recent_prompts';
  static const String settingsKey = 'app_settings';
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 4.0;
  
  // Generation Limits
  static const int maxPromptLength = 500;
  static const int freeGenerationsPerDay = 5;
  static const int premiumGenerationsPerDay = 100;
  
  // Image Dimensions
  static const List<Map<String, dynamic>> aspectRatios = [
    {'name': 'Square', 'ratio': '1:1', 'width': 512, 'height': 512},
    {'name': 'Portrait', 'ratio': '3:4', 'width': 768, 'height': 1024},
    {'name': 'Landscape', 'ratio': '4:3', 'width': 1024, 'height': 768},
    {'name': 'Wide', 'ratio': '16:9', 'width': 1024, 'height': 576},
  ];
}

class AppStrings {
  // Onboarding
  static const String welcomeTitle = 'Welcome to Dream Art AI';
  static const String welcomeSubtitle = 'Create stunning AI-generated artwork with just a few words';
  
  // Authentication
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String forgotPassword = 'Forgot Password?';
  static const String createAccount = 'Create Account';
  
  // Home Screen
  static const String quickGenerate = 'Quick Generate';
  static const String exploreGallery = 'Explore Gallery';
  static const String myLibrary = 'My Library';
  static const String trendingPrompts = 'Trending Prompts';
  
  // Generation
  static const String enterPrompt = 'Describe your dream artwork...';
  static const String generateArt = 'Generate Art';
  static const String generating = 'Creating your masterpiece...';
  static const String selectStyle = 'Select Art Style';
  static const String adjustSettings = 'Adjust Settings';
  
  // Styles
  static const String realistic = 'Realistic';
  static const String anime = 'Anime';
  static const String abstract = 'Abstract';
  static const String surreal = 'Surreal';
  static const String watercolor = 'Watercolor';
  static const String oilPainting = 'Oil Painting';
  static const String digitalArt = 'Digital Art';
  static const String sketch = 'Sketch';
  
  // Library
  static const String recent = 'Recent';
  static const String favorites = 'Favorites';
  static const String collections = 'Collections';
  static const String shared = 'Shared';
  
  // Settings
  static const String settings = 'Settings';
  static const String profile = 'Profile';
  static const String subscription = 'Subscription';
  static const String notifications = 'Notifications';
  static const String privacy = 'Privacy';
  static const String about = 'About';
  
  // Errors
  static const String networkError = 'Network connection failed';
  static const String generationError = 'Failed to generate artwork';
  static const String saveError = 'Failed to save artwork';
  static const String unknownError = 'An unexpected error occurred';
}