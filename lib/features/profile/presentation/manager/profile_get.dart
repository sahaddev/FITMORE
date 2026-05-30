import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/models/user/db_model.dart';
import '../../../../core/theme/text_style.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

class ProfileGet extends GetxController {
  var selectedImage = Rxn<File>();

  UserModel userModel = UserModel(
      active: true,
      email: 'test@gmail.com',
      id: 1,
      name: 'Tester',
      password: '12345678',
      phoneNumber: '12345678');

  signOut(BuildContext ctx) {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Are your sure to Logout?",
        style: TextStyles.heading2,
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.all(24.sp),
      actions: [
        IconButton(
            onPressed: () {
              NavigationService.pop();
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
            )),
        IconButton(
            onPressed: () async {
              final shareprefe = await SharedPreferences.getInstance();
              await shareprefe.clear();
              // ignore: use_build_context_synchronously
              NavigationService.pushNamedAndRemoveUntil(AppRouters.login);
            },
            icon: const Icon(
              Icons.done,
              color: Colors.grey,
            )),
      ],
    ));
  }

  updateUserdetailsOnAclike({
    required TextEditingController nameEditcontroller,
    required TextEditingController phonenumberEditcontroller,
    required TextEditingController emailEditconstroller,
    required UserModel userModel,
  }) async {}

  changingPassword({
    required TextEditingController oldPasswordEditcontroller,
    required TextEditingController newPasswordEditcontroller,
    required TextEditingController conformPasswordEditconstroller,
    required String dbPasswordcontroller,
    required UserModel userModel,
    required BuildContext context,
  }) async {
    final oldpassword = oldPasswordEditcontroller.text;
    final newpassword = newPasswordEditcontroller.text;
    final conformPassword = conformPasswordEditconstroller.text;
    if (dbPasswordcontroller != oldpassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(15),
        content: Text('Wrong old Password'),
      ));
      return;
    }
    if (newpassword != conformPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(15),
        content: Text('Password does not match'),
      ));
      return;
    }

    if (userModel.password == oldpassword || newpassword == oldpassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 131, 131, 131),
        margin: EdgeInsets.all(15),
        content: Text('Password changed'),
      ));
    }
  }

  Future<void> pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      selectedImage.value = File(returnedImage.path);

      // Update the user ID accordingly
    }
  }
}
