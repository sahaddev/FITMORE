import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../features/address/presentation/pages/edit_addres.dart';
import '../database/function/address_function.dart';

class AddressCard extends StatelessWidget {
  final int? id;
  final int index;
  final String? name;
  final String? phoneNumber;
  final String? city;
  final String? pincode;
  final String? state;

  const AddressCard({
    super.key,
    required this.index,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.city,
    required this.pincode,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if this is the primary address (e.g., first in the list for now)
    final bool isPrimary = index == 0;

    return Container(
      width: 100.w,
      margin: EdgeInsets.only(bottom: 2.h, left: 4.w, right: 4.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Name + Primary Badge
          Row(
            children: [
              Text(
                name ?? "Address",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (isPrimary) ...[
                SizedBox(width: 3.w),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9), // Light green bg
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "PRIMARY",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF43A047), // Green text
                    ),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 1.5.h),

          // Address Line 1 (Simulated with Phone for now or just generic text if street is missing)
          // Since we don't have street line, we'll use Phone as a contact line visual or omit if preferred.
          // The image has a street line "452 Pine Street". We'll try to use Name or City as line 1 if applicable,
          // but strictly adhering to data:
          Text(
            phoneNumber ?? "",
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          SizedBox(height: 0.5.h),

          // Address Line 2 (City, State, Zip)
          Text(
            "$city, $state $pincode",
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),

          SizedBox(height: 2.h),

          // Actions Row (Edit / Delete) - Kept subtle to match clean UI
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => EditAddressScreen(index),
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Text(
                    "Edit",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              InkWell(
                onTap: () {
                  addres.deleteAddress(id);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Text(
                    "Remove",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFE53935), // Red
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
