import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/payment/presentation/manager/payment_get.dart';
import '../../features/payment/presentation/pages/patment_scr_two.dart';
import '../../features/payment/presentation/pages/payment_scr.dart';
import '../database/function/product_db_function.dart';
import '../database/models/product/db_product_model.dart';

class PaymConAndPrice extends StatelessWidget {
  const PaymConAndPrice({
    super.key,
    required this.newPrice,
    required this.data,
    required this.widget,
    required this.quantity,
  });

  final int? newPrice;
  final ProductModel data;
  final PaymentScreen widget;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      width: double.infinity,
      height: 12.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TOTAL TO PAY",
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                newPrice == null ? '\$${data.price}.00' : '\$$newPrice.00',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50.w,
            height: 6.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2152F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentScreenTwo(
                    productIndex: widget.productIndex,
                    price: newPrice ?? data.price,
                    quantity: quantity,
                    image: data.image1,
                    title: data.title,
                  ),
                ));
              },
              child: Text(
                'Continue to Payment',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymCalculateCard extends StatelessWidget {
  const PaymCalculateCard({
    super.key,
    required this.widget,
    required this.quantity,
    required this.newPrice,
  });

  final PaymentScreen widget;
  final int quantity;
  final int? newPrice;

  @override
  Widget build(BuildContext context) {
    final paymentGet = Get.put(PaymentGet());

    return ValueListenableBuilder(
      valueListenable: productListNotifier,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        final data = productList[widget.productIndex];
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price ($quantity item)',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        newPrice == null
                            ? '\$${data.price}.00'
                            : '\$$newPrice.00',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Charges',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5F9EA),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'FREE',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF27C24C),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  newPrice == null ? '\$${data.price}.00' : '\$$newPrice.00',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF2152F3),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.all(2.w),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFFE5F9EA),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(Icons.verified,
                      color: const Color(0xFF27C24C), size: 14.sp),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Text(
                      'You will save \$${paymentGet.discoundCalculatorr(newPrice)} on this order',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF248035),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class PaymProDelCard1 extends StatelessWidget {
  const PaymProDelCard1({
    super.key,
    required this.image64,
    required this.data,
  });

  final Uint8List image64;
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 11.h,
          width: 11.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: MemoryImage(image64),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                'Size: US 10 / EU 44', // Replaced static 'size:6' with image placeholder text
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 0.8.h),
              Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Icon(Icons.star, color: Colors.amber, size: 16.sp),
                  Icon(Icons.star, color: Colors.grey.shade300, size: 16.sp),
                  SizedBox(width: 2.w),
                  Text(
                    '(11,325)',
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    '\$${data.price}.00',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    '5% OFF',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF27C24C),
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PaymShowDisText extends StatelessWidget {
  const PaymShowDisText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Delivery',
            style: GoogleFonts.poppins(
                color: Colors.grey.shade400, fontSize: 14.sp),
          ),
          Text(
            'FREE Delivery',
            style: GoogleFonts.poppins(
                color: const Color(0xFF27C24C),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(width: 4.w)
    ]);
  }
}
