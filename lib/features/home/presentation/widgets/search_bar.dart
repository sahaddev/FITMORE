import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CusSearchBar extends StatelessWidget {
  const CusSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 6.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Search..',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[400],
                  fontSize: 13.sp,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                  size: 18.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 1.5.h),
              ),
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Container(
          height: 6.h,
          width: 6.h,
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6), // Or accent color if needed
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.tune, color: Colors.black, size: 18.sp),
        ),
      ],
    );
  }
}
