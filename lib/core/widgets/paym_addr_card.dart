import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/payment/presentation/pages/payment_address.dart';
import '../../features/payment/presentation/pages/payment_scr.dart';
import '../database/function/address_function.dart';
import '../database/models/address/db_address_model.dart';

class PaymentAddresCard extends StatelessWidget {
  const PaymentAddresCard({
    super.key,
    required this.widget,
  });

  final PaymentScreen widget;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: addressListNotifyer,
      builder:
          (BuildContext context, List<AddressModel> addresList, Widget? child) {
        if (addresList.isEmpty) return const SizedBox(); // Handle empty case
        final data = addresList[widget.index];
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.name,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "HOME",
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade600,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PaymentAddress(productIndex: widget.productIndex),
                      ));
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Change',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2152F3),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              Text(
                '${data.city}, ${data.state}, ${data.city} - ${data.pincode}',
                style: GoogleFonts.poppins(
                    color: Colors.grey.shade700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 0.5.h),
              Text(
                data.phonenumber,
                style: GoogleFonts.poppins(
                    color: Colors.grey.shade700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );
      },
    );
  }
}
