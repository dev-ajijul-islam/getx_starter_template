import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../presentation/widgets/common_button.dart';
import '../../../../presentation/widgets/common_text_field.dart';
import '../../../../core/utils/app_validator.dart';
import '../../controllers/profile_controller.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.profileFormKey,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
              const SizedBox(height: 24),
              CommonTextField(
                controller: controller.nameController,
                hintText: 'Full Name',
                validator: (v) => v!.isEmpty ? 'Name cannot be empty' : null,
              ),
              const SizedBox(height: 16),
              CommonTextField(
                controller: controller.emailController,
                hintText: 'Email Address',
                validator: AppValidator.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CommonTextField(
                controller: controller.phoneController,
                hintText: 'Phone Number',
              ),
              const SizedBox(height: 32),
              Obx(
                () => CommonButton(
                  text: 'Update Profile',
                  onTap: controller.updateProfile,
                  isLoading: controller.isUpdateLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
