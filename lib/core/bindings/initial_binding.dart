import 'package:get/get.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/services/auth_remote_service.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../../features/bottom_nav/controllers/bottom_nav_controller.dart';
import '../../features/onboarding/controllers/onboarding_controller.dart';
import '../../features/profile/controllers/profile_controller.dart';
import '../../features/splash/controllers/splash_controller.dart';
import '../services/socket_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut(() => SocketService(), fenix: true);
    Get.lazyPut(() => AuthRemoteService(), fenix: true);

    // Repositories
    Get.lazyPut(
      () => AuthRepository(Get.find<AuthRemoteService>()),
      fenix: true,
    );

    // Controllers
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => OnboardingController(), fenix: true);
    Get.lazyPut(() => AuthController(Get.find<AuthRepository>()), fenix: true);
    Get.lazyPut(() => BottomNavController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
