import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/models/user/db_model.dart';
import '../pages/edit_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/edit_profile/edit_profile_bloc.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({
    super.key,
    required this.foemKey,
    required TextEditingController oldPasswordEditcontroller,
    required TextEditingController newPasswordEditcontroller,
    required TextEditingController conformPasswordEditconstroller,
    required TextEditingController dbPasswordcontroller,
    required UserModel userModel,
  })  : _oldPasswordEditcontroller = oldPasswordEditcontroller,
        _newPasswordEditcontroller = newPasswordEditcontroller,
        _conformPasswordEditconstroller = conformPasswordEditconstroller,
        _userModel = userModel;

  final GlobalKey<FormState> foemKey;
  final TextEditingController _oldPasswordEditcontroller;
  final TextEditingController _newPasswordEditcontroller;
  final TextEditingController _conformPasswordEditconstroller;
  final UserModel _userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: foemKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Change Password',
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "Update your security credentials below.",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        LabelInputContainer(
                          label: "Old Password",
                          child: AceternityInput(
                            hintText: "Enter old password",
                            controller: _oldPasswordEditcontroller,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter old password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 2.h),
                        LabelInputContainer(
                          label: "New Password",
                          child: AceternityInput(
                            hintText: "Enter new password",
                            controller: _newPasswordEditcontroller,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter new password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 2.h),
                        LabelInputContainer(
                          label: "Confirm Password",
                          child: AceternityInput(
                            hintText: "Confirm new password",
                            controller: _conformPasswordEditconstroller,
                            obscureText: true,
                            validator: (value) {
                              if (value != _newPasswordEditcontroller.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 1.5.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            InkWell(
                              onTap: () {
                                if (foemKey.currentState!.validate()) {
                                  context.read<EditProfileBloc>().add(
                                        EditProfileEvent.changePassword(
                                          _userModel,
                                          _oldPasswordEditcontroller.text,
                                          _newPasswordEditcontroller.text,
                                        ),
                                      );
                                }
                              },
                              child: BlocBuilder<EditProfileBloc,
                                  EditProfileState>(
                                builder: (context, state) {
                                  final isLoading = state.maybeWhen(
                                    loading: () => true,
                                    orElse: () => false,
                                  );
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 1.5.h),
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
                                          color: Colors.black
                                              .withValues(alpha: 0.1),
                                          offset: const Offset(0, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: isLoading
                                        ? const SizedBox(
                                            height: 18,
                                            width: 18,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            "Submit",
                                            style: GoogleFonts.inter(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Text(
          'Update your password',
          textAlign: TextAlign.end,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
