import 'package:e_commerce/core/widgets/appbar.dart';
import 'package:e_commerce/features/address/presentation/manager/address_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/database/function/address_function.dart';
import '../../../../core/database/models/address/db_address_model.dart';
import 'add_address.dart'; // Import to reuse LabelInputContainer and AceternityInput

class EditAddressScreen extends StatefulWidget {
  final int index;
  const EditAddressScreen(this.index, {super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late TextEditingController _nameEditcontroller;
  late TextEditingController _phonenumberEditcontroller;
  late TextEditingController _cityEditcontroller;
  late TextEditingController _pincodeEditcontroller;
  late TextEditingController _stateEditcontroller;
  late AddressModel _addresModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameEditcontroller = TextEditingController();
    _phonenumberEditcontroller = TextEditingController();
    _cityEditcontroller = TextEditingController();
    _pincodeEditcontroller = TextEditingController();
    _stateEditcontroller = TextEditingController();
    final addressList = addressListNotifyer.value;
    _addresModel = addressList[widget.index];
    _nameEditcontroller.text = _addresModel.name;
    _phonenumberEditcontroller.text = _addresModel.phonenumber;
    _cityEditcontroller.text = _addresModel.city;
    _pincodeEditcontroller.text = _addresModel.pincode;
    _stateEditcontroller.text = _addresModel.state;
    super.initState();
  }

  @override
  void dispose() {
    _nameEditcontroller.dispose();
    _phonenumberEditcontroller.dispose();
    _cityEditcontroller.dispose();
    _pincodeEditcontroller.dispose();
    _stateEditcontroller.dispose();
    super.dispose();
  }

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
                    "Edit Address", // Changed title
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Update your address details below.", // Changed description
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
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
                          value!.isEmpty ? "Please enter your name" : null,
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
                          value!.isEmpty ? "Enter your phone number" : null,
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
                                value!.isEmpty ? "Enter your City" : null,
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
                                value!.isEmpty ? "Enter your State" : null,
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
                          value!.isEmpty ? "Enter your Pincode" : null,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // Gradient Button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        addressGet.updateAddressOnButtonClick(
                            nameEditcontroller: _nameEditcontroller,
                            phonenumberEditcontroller:
                                _phonenumberEditcontroller,
                            cityEditcontroller: _cityEditcontroller,
                            pincodeEditcontroller: _pincodeEditcontroller,
                            stateEditcontroller: _stateEditcontroller,
                            addresModel: _addresModel);
                        Navigator.of(context).pop();
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
                        "Update Address",
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
