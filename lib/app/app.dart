import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/bindings/initial_binding.dart';
import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
