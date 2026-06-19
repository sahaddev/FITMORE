import 'package:e_commerce/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/add_address/add_address_bloc.dart';
import '../blocs/address/address_bloc.dart';
import '../../../../../core/models/address/db_address_model.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  final _nameEditcontroller = TextEditingController();
  final _phonenumberEditcontroller = TextEditingController();
  final _cityEditcontroller = TextEditingController();
  final _pincodeEditcontroller = TextEditingController();
  final _stateEditcontroller = TextEditingController();
  final _streetEditcontroller = TextEditingController();
  final _areaEditcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.black.withValues(alpha: 0.05),
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

                  // Street Name and Area in a Row
                  Row(
                    children: [
                      Expanded(
                        child: LabelInputContainer(
                          label: "Street Name",
                          child: AceternityInput(
                            hintText: "Enter street name",
                            controller: _streetEditcontroller,
                            validator: (value) =>
                                value!.isEmpty ? "Enter street name" : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: LabelInputContainer(
                          label: "Area",
                          child: AceternityInput(
                            hintText: "Enter area",
                            controller: _areaEditcontroller,
                            validator: (value) =>
                                value!.isEmpty ? "Enter area" : null,
                          ),
                        ),
                      ),
                    ],
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
                  BlocConsumer<AddAddressBloc, AddAddressState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                          context.read<AddressBloc>().add(const AddressEvent.getAllAddresses());
                          Navigator.pop(context);
                        },
                        failure: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
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
                                if (_formKey.currentState!.validate()) {
                                  final address = AddressModel(
                                    name: _nameEditcontroller.text,
                                    phonenumber: _phonenumberEditcontroller.text,
                                    city: _cityEditcontroller.text,
                                    state: _stateEditcontroller.text,
                                    pincode: _pincodeEditcontroller.text,
                                    streetName: _streetEditcontroller.text,
                                    area: _areaEditcontroller.text,
                                  );
                                  context.read<AddAddressBloc>().add(
                                        AddAddressEvent.addAddress(address),
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
                                  "Add Address  →",
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
