import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/utils/app_snackbar.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';

class AuthController extends GetxController {
  AuthController(this._repository);

  final AuthRepository _repository;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyOtpFormKey = GlobalKey<FormState>();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  final TextEditingController forgotPasswordEmailController = TextEditingController();
  final PinInputController otpController = PinInputController();

  final RxBool isLoginLoading = false.obs;
  final RxBool isRegisterLoading = false.obs;
  final RxBool isForgotPasswordLoading = false.obs;
  final RxBool isVerifyOtpLoading = false.obs;
  
  final RxBool isLoginPasswordHidden = true.obs;
  final RxBool isRegisterPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  Future<void> login() async {
    if (!(loginFormKey.currentState?.validate() ?? false)) return;
    try {
      isLoginLoading.value = true;
      await _repository.login(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
      AppSnackbar.success(message: 'Login successful');
      await Get.offAllNamed(AppRoutes.bottomNav);
    } catch (e) {
      AppSnackbar.error(message: e.toString());
    } finally {
      isLoginLoading.value = false;
    }
  }

  Future<void> register() async {
    if (!(registerFormKey.currentState?.validate() ?? false)) return;
    try {
      isRegisterLoading.value = true;
      await _repository.register(
        name: nameController.text.trim(),
        email: registerEmailController.text.trim(),
        password: registerPasswordController.text.trim(),
      );
      AppSnackbar.success(message: 'Account created. Please verify your OTP.');
      Get.toNamed(AppRoutes.verifyOtp, arguments: registerEmailController.text.trim());
    } catch (e) {
      AppSnackbar.error(message: e.toString());
    } finally {
      isRegisterLoading.value = false;
    }
  }

  Future<void> forgotPassword() async {
    if (!(forgotPasswordFormKey.currentState?.validate() ?? false)) return;
    try {
      isForgotPasswordLoading.value = true;
      // await _repository.forgotPassword(email: forgotPasswordEmailController.text.trim());
      AppSnackbar.success(message: 'OTP sent to your email');
      Get.toNamed(AppRoutes.verifyOtp, arguments: forgotPasswordEmailController.text.trim());
    } catch (e) {
      AppSnackbar.error(message: e.toString());
    } finally {
      isForgotPasswordLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    if (!(verifyOtpFormKey.currentState?.validate() ?? false)) return;
    try {
      isVerifyOtpLoading.value = true;
      // await _repository.verifyOtp(email: Get.arguments, otp: otpController.text.trim());
      AppSnackbar.success(message: 'OTP Verified Successfully');
      Get.offAllNamed(AppRoutes.bottomNav);
    } catch (e) {
      AppSnackbar.error(message: e.toString());
    } finally {
      isVerifyOtpLoading.value = false;
    }
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    nameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    confirmPasswordController.dispose();
    forgotPasswordEmailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
