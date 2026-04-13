import 'package:get/get.dart';

import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
import '../features/bottom_nav/presentation/screens/bottom_nav_holder_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/profile/presentation/screens/edit_profile_screen.dart';
import '../features/profile/presentation/screens/static_content_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(name: AppRoutes.verifyOtp, page: () => const VerifyOtpScreen()),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => const BottomNavHolderScreen(),
    ),
    GetPage(name: AppRoutes.editProfile, page: () => const EditProfileScreen()),
    GetPage(
      name: AppRoutes.terms,
      page: () => const StaticContentScreen(
        title: 'Terms & Conditions',
        content: 'Your terms and conditions content goes here...',
      ),
    ),
    GetPage(
      name: AppRoutes.privacy,
      page: () => const StaticContentScreen(
        title: 'Privacy Policy',
        content: 'Your privacy policy content goes here...',
      ),
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => const StaticContentScreen(
        title: 'About Us',
        content: 'Your about us content goes here...',
      ),
    ),
  ];
}
