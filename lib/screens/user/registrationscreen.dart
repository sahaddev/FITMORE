import 'package:e_commerce/service/model/user_model.dart';
import 'package:e_commerce/service/user.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../application/features/auth/getx/auth_get.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _nameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController(); // Added controller
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  final authGet = Get.put(AuthGet());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade100,
                    ),
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 16.sp, color: Colors.black),
                  ),
                ),
                SizedBox(height: 1.h),

                // Title
                Center(
                  child: Text(
                    'Complete Profile',
                    style: GoogleFonts.manrope(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 1.h),

                // Subtitle
                Center(
                  child: Text(
                    'Complete profile for your further move and\naccess to all features.',
                    style: GoogleFonts.manrope(
                      fontSize: 12.sp,
                      color: Colors.grey.shade500,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 3.h),

                // Name Label
                _buildLabel('Name'),
                SizedBox(height: 0.5.h),
                _buildTextField(
                  controller: _nameController,
                  hintText: 'Enter your full name',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 1.5.h),

                // Phone Number Label
                _buildLabel('Phone Number'),
                SizedBox(height: 0.5.h),
                _buildTextField(
                  controller: _phonenumberController,
                  hintText: 'Enter your phone number',
                  icon: Icons.phone_iphone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 1.5.h),

                // Email Label
                _buildLabel('Email'),
                SizedBox(height: 0.5.h),
                _buildTextField(
                  controller: _emailController,
                  hintText: 'example@email.com',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 1.5.h),

                // Password Label
                _buildLabel('Password'),
                SizedBox(height: 0.5.h),
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Create a password',
                  isObscure: _isPasswordObscure,
                  toggleObscure: () {
                    setState(() {
                      _isPasswordObscure = !_isPasswordObscure;
                    });
                  },
                  isPassword: true,
                ),
                SizedBox(height: 1.5.h),

                // Confirm Password Label
                _buildLabel('Confirm Password'),
                SizedBox(height: 0.5.h),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm your password',
                  isObscure: _isConfirmPasswordObscure,
                  toggleObscure: () {
                    setState(() {
                      _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                    });
                  },
                  isPassword: true,
                  icon: Icons
                      .lock_outline, // Defaults to eye if isPassword true, but here specific icon is lock in image? No, image has lock icon for confirm pass? Let's check.
                  // Image: Name->UserIcon, Phone->CheckIcon? No looks like MobileIcon, Email->Envelope, Password->EyeOff, ConfirmPassword->Lock.
                  // Actually the confirm password input has a LOCK icon on the RIGHT in the image.
                  // The Password input has an EYE icon on the RIGHT.
                ),
                SizedBox(height: 4.h),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 5.5.h,
                  child: ElevatedButton(
                    onPressed: _handleRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.manrope(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),

                // Terms text
                Center(
                  child: Column(
                    children: [
                      Text(
                        'By continuing you agree to our',
                        style: GoogleFonts.manrope(
                          fontSize: 10.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        'Terms and Conditions',
                        style: GoogleFonts.manrope(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    IconData? icon,
    bool isObscure = false,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? toggleObscure,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      style: GoogleFonts.manrope(fontSize: 14.sp),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            GoogleFonts.manrope(color: Colors.grey.shade400, fontSize: 13.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        suffixIcon: isPassword && toggleObscure != null
            ? IconButton(
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                  size: 16.sp,
                ),
                onPressed: toggleObscure,
              )
            // If it's not a password field but has an icon (like name, phone, email, confirm pass lock)
            : icon != null
                ? Icon(icon, color: Colors.grey, size: 16.sp)
                : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        return null; // Basic validation
      },
    );
  }

  void _handleRegister() {
    bool isEmailValid = EmailValidator.validate(_emailController.text);
    if (!isEmailValid) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text('Enter a valid email'),
      ));
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text('Passwords do not match'),
      ));
      return;
    }

    if (_formKey.currentState!.validate()) {
      UserApiService()
          .addUser(User(
            email: _emailController.text,
            name: _nameController.text,
            phoneNumber: _phonenumberController.text,
            password: _passwordController
                .text, // Fixed typo from original '_passwordControlle'
            active: true,
          ))
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.grey,
                margin: const EdgeInsets.all(15),
                content: Text(value),
              )));
    }
  }
}
