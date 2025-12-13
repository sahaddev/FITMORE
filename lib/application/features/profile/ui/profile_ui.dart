import 'dart:io';

import 'package:e_commerce/application/features/profile/getX/profile_get.dart';
import 'package:e_commerce/screens/admin/admin_login.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/edit_profile.dart';
import 'package:e_commerce/screens/user/myorder_screen.dart';
import 'package:e_commerce/application/features/terms/ui/about_us.dart';
import 'package:e_commerce/application/features/terms/ui/terms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfileUi extends StatelessWidget {
  const ProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    final profileGet = Get.put(ProfileGet());
    profileGet.initialdata();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7), // Light grey background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCircleButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () {
                        // Navigation pop if applicable, or maybe this is a main tab so no back?
                        // Assuming it might be nested or just for visual consistency with design.
                        // But usually a main tab doesn't pop.
                        // Leaving empty or Navigator.maybePop if needed.
                        // Design shows back button.
                        Navigator.maybePop(context);
                      },
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.manrope(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    _buildCircleButton(
                      icon: Icons.logout_outlined, // Logout Icon
                      onTap: () {
                        profileGet.signOut(context);
                      },
                    ),
                  ],
                ),
              ),

              // Profile Card
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(() {
                  final imagePath = profileGet.selectedImage.value?.path;
                  final hasImage = imagePath != null;

                  return Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: hasImage
                                    ? FileImage(File(imagePath))
                                        as ImageProvider
                                    : const AssetImage(
                                        'asset/images (profile).jpg'), // Fixed asset path string from original
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 4.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF22C55E), // Green status dot
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileGet.userModel.name ?? "User Name",
                              style: GoogleFonts.manrope(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              profileGet.userModel.email ?? "email@example.com",
                              style: GoogleFonts.manrope(
                                fontSize: 12.sp,
                                color: Colors.grey.shade500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              profileGet.userModel.phoneNumber ?? "+1234567890",
                              style: GoogleFonts.manrope(
                                fontSize: 12.sp,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditProfile(user: profileGet.userModel),
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit,
                              size: 18.sp, color: Colors.grey.shade700),
                        ),
                      )
                    ],
                  );
                }),
              ),
              SizedBox(height: 4.h),

              // App Settings Section
              _buildSectionTitle('APP SETTINGS'),
              SizedBox(height: 1.5.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.home_outlined,
                      title: 'Addresses',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddressScreen(),
                        ));
                      },
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.shopping_bag_outlined,
                      title: 'Order History',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyOrderScreen(),
                        ));
                      },
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.admin_panel_settings_outlined,
                      title: 'Admin Login',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminLogin(),
                        ));
                      },
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.lock_outline,
                      title: 'Privacy & Terms',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsOne(),
                        ));
                      },
                    ),
                    _buildDivider(),
                    _buildSettingsItem(
                      icon: Icons.headset_mic_outlined,
                      title: 'Help & Support',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutUs(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),

              // Popular Section (Placeholder functionality matching design structure)
              _buildSectionTitle('POPULAR'),
              SizedBox(height: 1.5.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.security_outlined,
                      title: 'Safety Preferences',
                      onTap: () {},
                    ),
                    // _buildDivider(), // No divider for single item or last item if we want
                  ],
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade600,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20), // For ripple effect
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:
                      BorderRadius.circular(10), // Rounded square icon bg
                ),
                child: Icon(icon, color: Colors.black87, size: 20.sp),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 16.sp, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 0.5,
      color: Colors.grey.shade200,
      indent: 18.w, // Indent to align with text start (icon width + spacing)
    );
  }

  Widget _buildCircleButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 10.w,
        height: 10.w, // Circular
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, size: 18.sp, color: Colors.black87),
      ),
    );
  }
}
