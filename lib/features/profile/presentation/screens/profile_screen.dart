import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../presentation/widgets/common_card.dart';
import '../../../../presentation/widgets/common_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Column(
            children: [
              CommonText(text: "John Doe", fontSize: 22, fontWeight: FontWeight.bold),
              CommonText(text: "john.doe@example.com", color: Colors.grey),
            ],
          ),
        ),
        const SizedBox(height: 32),
        CommonCard(
          child: Column(
            children: [
              _buildProfileTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () => Get.toNamed(AppRoutes.editProfile),
              ),
              _buildProfileTile(
                icon: Icons.description_outlined,
                title: "Terms & Conditions",
                onTap: () => Get.toNamed(AppRoutes.terms),
              ),
              _buildProfileTile(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () => Get.toNamed(AppRoutes.privacy),
              ),
              _buildProfileTile(
                icon: Icons.info_outline,
                title: "About Us",
                onTap: () => Get.toNamed(AppRoutes.aboutUs),
              ),
              const Divider(),
              _buildProfileTile(
                icon: Icons.logout,
                title: "Logout",
                color: Colors.red,
                onTap: () => Get.offAllNamed(AppRoutes.login),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
