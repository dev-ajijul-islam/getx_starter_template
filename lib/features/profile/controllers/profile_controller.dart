import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_snackbar.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  
  final TextEditingController nameController = TextEditingController(text: "John Doe");
  final TextEditingController emailController = TextEditingController(text: "john.doe@example.com");
  final TextEditingController phoneController = TextEditingController(text: "+1 234 567 890");

  final RxBool isUpdateLoading = false.obs;

  Future<void> updateProfile() async {
    if (!(profileFormKey.currentState?.validate() ?? false)) return;
    
    try {
      isUpdateLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      AppSnackbar.success(message: 'Profile updated successfully');
    } catch (e) {
      AppSnackbar.error(message: 'Failed to update profile');
    } finally {
      isUpdateLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
