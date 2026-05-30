import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBannerOrderPage extends StatelessWidget {
  const TopBannerOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: SizedBox(
            height: 5.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildStep(
                    isActive: true,
                    isCompleted: true,
                    label: "1",
                    icon: Icons.check),
                Expanded(
                  child: Container(
                    height: 2,
                    color: const Color(0xFF2152F3),
                  ),
                ),
                _buildStep(
                    isActive: true, isCompleted: false, label: "2", icon: null),
                Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
                _buildStep(
                    isActive: false,
                    isCompleted: false,
                    label: "3",
                    icon: null),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 4.w),
            Text(
              "ADDRESS",
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              "SUMMARY",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF2152F3),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(
              "PAYMENT",
              style: GoogleFonts.poppins(
                  color: Colors.grey.shade400,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 4.w),
          ],
        )
      ],
    );
  }

  Widget _buildStep(
      {required bool isActive,
      required bool isCompleted,
      required String label,
      IconData? icon}) {
    return Container(
      height: 3.5.h,
      width: 3.5.h,
      decoration: BoxDecoration(
        color: isCompleted || isActive
            ? const Color(0xFF2152F3)
            : Colors.grey.shade200,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.5,
          color: isCompleted || isActive
              ? const Color(0xFF2152F3)
              : Colors.grey.shade300,
        ),
      ),
      child: Center(
        child: isCompleted && icon != null
            ? Icon(
                icon,
                size: 12.sp,
                color: Colors.white,
              )
            : Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: isActive ? Colors.white : Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
