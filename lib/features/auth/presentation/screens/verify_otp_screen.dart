import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_colors.dart';
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.h,),
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
                        onCompleted: (pin) {
                          controller.otpController.text = pin;
                          controller.verifyOtp();
                        },
                        onChanged: (value) {
                          controller.otpController.text = value;
                        },
                        theme: MaterialPinTheme(

                          shape: MaterialPinShape.outlined,
                          cellSize: const Size(50, 60),
                          spacing: 12,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderWidth: 1.5,
                          focusedBorderWidth: 2.5,
                          borderColor: AppColors.border,
                          focusedBorderColor: AppColors.primary,
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
                      const SizedBox(height: 24),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Didn't receive the code? "),
                            controller.canResendOtp.value
                                ? TextButton(
                                    onPressed: controller.resendOtp,
                                    child: const Text(
                                      'Resend',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  )
                                : Text(
                                    '00:${controller.timerSeconds.value.toString().padLeft(2, '0')}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey,
                                    ),
                                  ),
                          ],
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
