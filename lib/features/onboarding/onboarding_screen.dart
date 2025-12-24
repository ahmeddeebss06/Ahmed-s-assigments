import 'package:flutter/material.dart';

import '../../core/resources/app_button_styles.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/app_icons.dart';
import '../../core/resources/app_router.dart';
import '../../core/resources/app_text_styles.dart';
import 'widgets/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': AppIcons.onboarding1,
      'title': 'Now reading books will be easier',
      'description':
          'Discover and read a variety of books from different genres and authors all in one app.',
    },
    {
      'image': AppIcons.onboarding2,
      'title': 'Your Own Digital Library',
      'description':
          'Access thousands of books anytime, anywhere. Create your personal collection today.',
    },
    {
      'image': AppIcons.onboarding3,
      'title': 'Join a Community of Readers',
      'description':
          'Share your thoughts, review books, and connect with other book lovers around the world.',
    },
  ];

  void _onContinue() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Page View
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: _pages[index]['image']!,
                  title: _pages[index]['title']!,
                  description: _pages[index]['description']!,
                );
              },
            ),

            // Skip Button (Top Right)
            if (_currentIndex < _pages.length - 1)
              Positioned(
                top: 24,
                right: 24,
                child: TextButton(
                  onPressed: _navigateToLogin,
                  child: Text(
                    'Skip',
                    style: AppTextStyles.primaryColor14RobotoMedium,
                  ),
                ),
              ),

            // Bottom Section (Dots + Buttons)
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Dots Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? AppColors.primaryColor
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Main Button
                  ElevatedButton(
                    onPressed: _onContinue,
                    style: AppButtonStyles.primaryButtonStyle,
                    child: Text(
                      _currentIndex == _pages.length - 1
                          ? 'Get Started'
                          : 'Continue',
                      style: AppTextStyles.whiteColor16OpenSansBold,
                    ),
                  ),

                  // Secondary Button (Sign In) - only on last page usually, or always?
                  // Design typically asks for Sign In on last page or accessible.
                  // Current flow has "Get Started" -> Login.
                  // I'll add "Sign In" button below if user prefers, but for now
                  // "Get Started" goes to Login which is the requirement.
                  if (_currentIndex == _pages.length - 1) ...[
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _navigateToLogin,
                      style: AppButtonStyles.secondaryButtonStyle,
                      child: Text(
                        'Sign In',
                        style: AppTextStyles.whiteColor16OpenSansBold.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

