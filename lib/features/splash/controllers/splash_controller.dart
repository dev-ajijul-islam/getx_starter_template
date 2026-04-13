import 'package:get/get.dart';

import '../../../core/constants/app_durations.dart';
import '../../../core/services/storage_service.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future<void>.delayed(AppDurations.splash);
    final bool hasSeenOnboarding = StorageService.getBool(
      'has_seen_onboarding',
    );
    Get.offAllNamed(hasSeenOnboarding ? AppRoutes.login : AppRoutes.onboarding);
  }
}
