import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../presentation/widgets/common_button.dart';
import '../../../../presentation/widgets/common_card.dart';
import '../../../../presentation/widgets/common_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_switch_row.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 46),
                const AuthHeader(
                  title: AppStrings.welcomeBack,
                  subtitle: AppStrings.loginSubtitle,
                ),
                const SizedBox(height: 28),
                CommonCard(
                  child: Column(
                    children: <Widget>[
                      CommonTextField(
                        controller: controller.loginEmailController,
                        hintText: AppStrings.email,
                        validator: AppValidator.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => CommonTextField(
                          controller: controller.loginPasswordController,
                          hintText: AppStrings.password,
                          validator: AppValidator.password,
                          obscureText: controller.isLoginPasswordHidden.value,
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.isLoginPasswordHidden.toggle(),
                            icon: Icon(
                              controller.isLoginPasswordHidden.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: controller.goToForgotPassword,
                          child: const Text(AppStrings.forgotPassword),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Obx(
                        () => CommonButton(
                          text: AppStrings.signIn,
                          onTap: controller.login,
                          isLoading: controller.isLoginLoading.value,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AuthSwitchRow(
                  question: "Don't have an account?",
                  actionText: AppStrings.signUp,
                  onTap: controller.goToRegister,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
