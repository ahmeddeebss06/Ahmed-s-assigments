import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 56),
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.whiteColor,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 56),
    backgroundColor: AppColors.whiteColor,
    foregroundColor: AppColors.primaryColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),
  );
}

