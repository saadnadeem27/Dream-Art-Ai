import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../widgets/glass_widgets.dart';
import '../../../core/theme/app_theme.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Skip Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: controller.skipOnboarding,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // Content
              Expanded(
                child: Obx(() {
                  final data =
                      controller.onboardingData[controller.currentPage.value];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon
                        FadeIn(
                          key: ValueKey(controller.currentPage.value),
                          duration: const Duration(milliseconds: 600),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppTheme.glassGradient,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                data['icon']!,
                                style: const TextStyle(fontSize: 80),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),

                        // Title
                        FadeInUp(
                          key:
                              ValueKey('title_${controller.currentPage.value}'),
                          duration: const Duration(milliseconds: 600),
                          child: Text(
                            data['title']!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Description
                        FadeInUp(
                          key: ValueKey('desc_${controller.currentPage.value}'),
                          delay: const Duration(milliseconds: 200),
                          duration: const Duration(milliseconds: 600),
                          child: Text(
                            data['description']!,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white70,
                                      height: 1.5,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),

              // Bottom Navigation
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Page Indicators
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.onboardingData.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: controller.currentPage.value == index
                                  ? 24
                                  : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: controller.currentPage.value == index
                                    ? AppTheme.primaryColor
                                    : Colors.white.withOpacity(0.3),
                              ),
                            ),
                          ),
                        )),

                    const SizedBox(height: 32),

                    // Next Button
                    Obx(() => GradientButton(
                          text: controller.currentPage.value ==
                                  controller.onboardingData.length - 1
                              ? 'Get Started'
                              : 'Next',
                          onPressed: controller.nextPage,
                          width: double.infinity,
                          height: 56,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
