import 'package:e_commerce/core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../manager/address_get.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final _formKey = GlobalKey<FormState>();

  final _nameEditcontroller = TextEditingController();
  final _phonenumberEditcontroller = TextEditingController();
  final _cityEditcontroller = TextEditingController();
  final _pincodeEditcontroller = TextEditingController();
  final _stateEditcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addressGet = Get.put(AddressGet());
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background
      appBar: mainTitle(""),
      body: SingleChildScrollView(
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
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add New Address",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[
                          800], // Using material colors close to neutral-800
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Please fill in the details below to complete your profile.",
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

                  // City and State in a Row
                  Row(
                    children: [
                      Expanded(
                        child: LabelInputContainer(
                          label: "City",
                          child: AceternityInput(
                            hintText: "City",
                            controller: _cityEditcontroller,
                            validator: (value) =>
                                value!.isEmpty ? "Enter city" : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: LabelInputContainer(
                          label: "State",
                          child: AceternityInput(
                            hintText: "State",
                            controller: _stateEditcontroller,
                            validator: (value) =>
                                value!.isEmpty ? "Enter state" : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),

                  // Pincode Field
                  LabelInputContainer(
                    label: "Pincode",
                    child: AceternityInput(
                      hintText: "Enter pincode",
                      controller: _pincodeEditcontroller,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? "Enter pincode" : null,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // Gradient Button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        addressGet.addAddressOnButtonClick(
                            nameEditcontroller: _nameEditcontroller,
                            phonenumberEditcontroller:
                                _phonenumberEditcontroller,
                            cityEditcontroller: _cityEditcontroller,
                            pincodeEditcontroller: _pincodeEditcontroller,
                            stateEditcontroller: _stateEditcontroller,
                            context: context);
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
                            color: Colors.white.withOpacity(0.25),
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
                      child: Text(
                        "Add Address  →",
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
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

  const AceternityInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50], // Valid gray
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
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
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
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
