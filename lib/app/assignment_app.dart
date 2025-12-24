import 'package:flutter/material.dart';

import '../core/resources/app_colors.dart';
import '../core/resources/app_router.dart';
import '../core/resources/app_text_styles.dart';

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Assignment',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.splashRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        fontFamily: AppTextStyles.fontFamily,
      ),
    );
  }
}

/*
AssignmentApp:
  - root widget
  - configures navigation
  - wires global theme/colors/fonts
*/

