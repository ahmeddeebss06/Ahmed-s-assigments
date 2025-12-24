import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(image)),
          const SizedBox(height: 32),
          Text(
            title,
            style: AppTextStyles.darkGreyColor28OpenSansBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppTextStyles.greyColor16Regular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80), // Space for bottom buttons
        ],
      ),
    );
  }
}

