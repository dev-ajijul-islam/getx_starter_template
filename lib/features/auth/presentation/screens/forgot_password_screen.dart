import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../presentation/widgets/common_button.dart';
import '../../../../presentation/widgets/common_card.dart';
import '../../../../presentation/widgets/common_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/auth_header.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.forgotPasswordFormKey,
            child: Column(
              children: <Widget>[
                const AuthHeader(
                  title: 'Forgot Password',
                  subtitle: 'Enter your email to receive an OTP code',
                ),
                const SizedBox(height: 28),
                CommonCard(
                  child: Column(
                    children: <Widget>[
                      CommonTextField(
                        controller: controller.forgotPasswordEmailController,
                        hintText: AppStrings.email,
                        validator: AppValidator.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => CommonButton(
                          text: 'Send OTP',
                          onTap: controller.forgotPassword,
                          isLoading: controller.isForgotPasswordLoading.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
