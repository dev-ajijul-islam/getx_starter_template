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

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.registerFormKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 24),
                const AuthHeader(
                  title: AppStrings.signUp,
                  subtitle: AppStrings.registerSubtitle,
                ),
                const SizedBox(height: 28),
                CommonCard(
                  child: Column(
                    children: <Widget>[
                      CommonTextField(
                        controller: controller.nameController,
                        hintText: AppStrings.fullName,
                        validator: (String? value) => AppValidator.required(value, fieldName: 'Name'),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      CommonTextField(
                        controller: controller.registerEmailController,
                        hintText: AppStrings.email,
                        validator: AppValidator.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => CommonTextField(
                          controller: controller.registerPasswordController,
                          hintText: AppStrings.password,
                          validator: AppValidator.password,
                          obscureText: controller.isRegisterPasswordHidden.value,
                          suffixIcon: IconButton(
                            onPressed: () => controller.isRegisterPasswordHidden.toggle(),
                            icon: Icon(
                              controller.isRegisterPasswordHidden.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => CommonTextField(
                          controller: controller.confirmPasswordController,
                          hintText: AppStrings.confirmPassword,
                          validator: (String? value) => AppValidator.confirmPassword(
                            value,
                            controller.registerPasswordController.text,
                          ),
                          obscureText: controller.isConfirmPasswordHidden.value,
                          suffixIcon: IconButton(
                            onPressed: () => controller.isConfirmPasswordHidden.toggle(),
                            icon: Icon(
                              controller.isConfirmPasswordHidden.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => CommonButton(
                          text: AppStrings.signUp,
                          onTap: controller.register,
                          isLoading: controller.isRegisterLoading.value,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AuthSwitchRow(
                  question: 'Already have an account?',
                  actionText: AppStrings.signIn,
                  onTap: controller.goToLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
