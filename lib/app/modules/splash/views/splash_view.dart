import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../widgets/glass_widgets.dart';
import '../../../core/theme/app_theme.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                
                // Logo Animation
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppTheme.primaryGradient,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.palette,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // App Title
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 800),
                  child: ShaderMask(
                    shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
                    child: Text(
                      'Dream Art AI',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    'Create • Inspire • Share',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                
                const Spacer(flex: 2),
                
                // Loading Animation
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Initializing AI Models...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}