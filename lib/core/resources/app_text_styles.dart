import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'OpenSans';

  static const TextStyle primaryColor14RobotoMedium = TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle darkGreyColor28OpenSansBold = TextStyle(
    color: AppColors.darkGreyColor,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1.3,
    fontFamily: fontFamily,
  );

  static const TextStyle greyColor16Regular = TextStyle(
    color: AppColors.greyColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.4,
  );

  static const TextStyle whiteColor16OpenSansBold = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    fontFamily: fontFamily,
  );
}

