import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../features/address/presentation/pages/add_address.dart';
import '../../features/address/presentation/pages/edit_addres.dart';
import '../../features/payment/presentation/pages/payment_scr.dart';
import '../database/function/address_function.dart';
import '../database/models/address/db_address_model.dart';

class PaymentAddrescard extends StatelessWidget {
  const PaymentAddrescard({
    super.key,
    required this.productIndex,
  });

  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: addressListNotifyer,
      builder: (BuildContext context, List<AddressModel> addressList,
          Widget? child) {
        return Stack(
          children: [
            ListView.builder(
              // Changed to builder, removed separator for cleaner look with card margins
              padding: const EdgeInsets.only(bottom: 100), // Space for FAB
              itemCount: addressList.length,
              itemBuilder: (context, index) {
                final data = addressList[index];
                final bool isPrimary =
                    index == 0; // Keeping logic for primary badge if needed

                // Using a card style similar to AddressCard but with selection action
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        index: index,
                        productIndex: productIndex,
                      ),
                    ));
                  },
                  child: Container(
                    width: 100.w,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  data.name,
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                if (isPrimary) ...[
                                  SizedBox(width: 3.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w, vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      "PRIMARY",
                                      style: GoogleFonts.inter(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF43A047),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            // Edit Action
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      EditAddressScreen(index),
                                ));
                              },
                              child: Text(
                                "Edit",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                        Text(
                          data.phonenumber,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          '${data.city}, ${data.state} ${data.pincode}',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Select to Pay",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Icon(Icons.arrow_forward,
                                size: 12.sp, color: Colors.grey[400]),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddAdress(),
                  ));
                },
                backgroundColor: Colors.black, // Dark theme accent
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
