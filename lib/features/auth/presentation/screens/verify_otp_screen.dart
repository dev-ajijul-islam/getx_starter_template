import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../presentation/widgets/common_button.dart';
import '../../../../presentation/widgets/common_card.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/auth_header.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.verifyOtpFormKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.h,),
                  AuthHeader(
                    title: 'Verify OTP',
                    subtitle: 'We have sent a 4-digit code to \n$email',
                  ),
                  const SizedBox(height: 28),
                  CommonCard(
                    child: Column(
                      children: <Widget>[
                        MaterialPinField(
                          length: 6,
                          onCompleted: (pin) => print('PIN: $pin'),
                          onChanged: (value) => print('Changed: $value'),
                          theme: MaterialPinTheme(
                            shape: MaterialPinShape.outlined,

                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Obx(
                          () => CommonButton(
                            text: 'Verify',
                            onTap: controller.verifyOtp,
                            isLoading: controller.isVerifyOtpLoading.value,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // Resend logic
                            AppSnackbar.success(message: 'OTP Resent');
                          },
                          child: const Text('Resend Code'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
