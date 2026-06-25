import 'package:e_commerce/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/user/db_model.dart';
import '../widgets/change_password.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import '../blocs/edit_profile/edit_profile_bloc.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;
  const EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _mainFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> foemKey = GlobalKey<FormState>();
  
  late TextEditingController _nameEditcontroller;
  late TextEditingController _phonenumberEditcontroller;
  late TextEditingController _emailEditconstroller;
  late TextEditingController _dbPasswordcontroller;

  final _oldPasswordEditcontroller = TextEditingController();
  final _newPasswordEditcontroller = TextEditingController();
  final _conformPasswordEditconstroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameEditcontroller = TextEditingController(text: widget.user.name ?? '');
    _phonenumberEditcontroller = TextEditingController(text: widget.user.phoneNumber ?? '');
    _emailEditconstroller = TextEditingController(text: widget.user.email ?? '');
    _dbPasswordcontroller = TextEditingController(text: widget.user.password ?? '');

    if (widget.user.id != null) {
      context.read<EditProfileBloc>().add(EditProfileEvent.load(id: widget.user.id!));
    }
  }

  @override
  void dispose() {
    _nameEditcontroller.dispose();
    _phonenumberEditcontroller.dispose();
    _emailEditconstroller.dispose();
    _dbPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: mainTitle(""),
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (user) {
              if (user is UserModel) {
                _nameEditcontroller.text = user.name ?? '';
                _phonenumberEditcontroller.text = user.phoneNumber ?? '';
                _emailEditconstroller.text = user.email ?? '';
                _dbPasswordcontroller.text = user.password ?? '';
              }
            },
            orElse: () {},
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Form(
                key: _mainFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Update your details below.",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.h),

                    // Name Field
                    LabelInputContainer(
                      label: "Name",
                      child: AceternityInput(
                        hintText: "Enter your name",
                        controller: _nameEditcontroller,
                        validator: (value) =>
                            value!.isEmpty ? "Enter your name" : null,
                      ),
                    ),
                    SizedBox(height: 2.h),

                    // Phone Number Field
                    LabelInputContainer(
                      label: "Phone Number",
                      child: AceternityInput(
                        hintText: "Enter your phone number",
                        controller: _phonenumberEditcontroller,
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            value!.isEmpty ? "Enter phone number" : null,
                      ),
                    ),
                    SizedBox(height: 2.h),

                    // Email Field
                    LabelInputContainer(
                      label: "Email",
                      child: AceternityInput(
                        hintText: "Enter your email",
                        controller: _emailEditconstroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value!.isEmpty ? "Enter email" : null,
                      ),
                    ),
                    SizedBox(height: 2.h),

                    ChangePasswordWidget(
                      foemKey: foemKey,
                      oldPasswordEditcontroller: _oldPasswordEditcontroller,
                      newPasswordEditcontroller: _newPasswordEditcontroller,
                      conformPasswordEditconstroller: _conformPasswordEditconstroller,
                      dbPasswordcontroller: _dbPasswordcontroller,
                      userModel: widget.user,
                    ),
                    SizedBox(height: 5.h),

                    // Gradient Button
                    BlocConsumer<EditProfileBloc, EditProfileState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          success: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                            NavigationService.pop();
                          },
                          failure: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          orElse: () {},
                        );
                      },
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );

                        return InkWell(
                          onTap: isLoading
                              ? null
                              : () {
                                  if (_mainFormKey.currentState?.validate() ?? true) {
                                    context.read<EditProfileBloc>().add(
                                          EditProfileEvent.updateProfile(
                                            widget.user,
                                            _nameEditcontroller.text,
                                            _phonenumberEditcontroller.text,
                                            _emailEditconstroller.text,
                                          ),
                                        );
                                  }
                                },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF18181B), // Zinc 900
                                  Color(0xFF27272A), // Zinc 800
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.25),
                                  offset: const Offset(0, 1),
                                  blurRadius: 0,
                                ),
                                const BoxShadow(
                                  color: Color(0x00000000), // Transparent base
                                  offset: Offset(0, -1),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    "Update  →",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LabelInputContainer extends StatelessWidget {
  final String label;
  final Widget child;

  const LabelInputContainer({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 1.h),
        child,
      ],
    );
  }
}

class AceternityInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const AceternityInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50], // Valid gray
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: GoogleFonts.inter(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            fontSize: 14.sp,
            color: Colors.grey[400],
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.black87, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
