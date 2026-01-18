import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/database/function/product_db_function.dart';
import '../../../../core/database/models/product/db_product_model.dart';
import '../../../../core/widgets/paym_addr_card.dart';
import '../../../../core/widgets/payment_widgets_main.dart';
import '../../../../core/widgets/tob_design_order.dart';

class PaymentScreen extends StatefulWidget {
  final int productIndex;
  final int index;
  const PaymentScreen(
      {required this.index, required this.productIndex, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int quantity = 1;
  int? newPrice;
  late ProductModel? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 20.sp,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Order Summary',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 2.h),
        children: [
          const TopBannerOrderPage(),
          SizedBox(height: 2.h),
          PaymentAddresCard(widget: widget),
          SizedBox(height: 2.h),
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (BuildContext context, List<ProductModel> productList,
                Widget? child) {
              if (productList.isEmpty ||
                  widget.productIndex >= productList.length) {
                return SizedBox();
              }
              final data = productList[widget.productIndex];
              final image = data.image1;
              final image64 = base64.decode(image);

              // Ensure newPrice is initialized if null
              // This acts as a side effect check, though generally should be in logic
              if (newPrice == null) {
                // Initialize outside build if possible, but safe here for display logic
              }

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    PaymProDelCard1(image64: image64, data: data),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 4.5.h,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade200)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                      newPrice = data.price * quantity;
                                    });
                                  }
                                },
                                icon: Icon(Icons.remove,
                                    color: Colors.black, size: 16.sp),
                              ),
                              Text('$quantity',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp)),
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                onPressed: () async {
                                  final productDB =
                                      await Hive.openBox<ProductModel>(
                                          'product_db');

                                  int count = 0;
                                  // Simple lookup
                                  final productInDb = productDB.values
                                      .firstWhere(
                                          (element) => element.id == data.id,
                                          orElse: () => data);
                                  count = productInDb.productCount;

                                  if (count > quantity) {
                                    setState(() {
                                      quantity++;
                                      newPrice = data.price * quantity;
                                    });
                                  } else {
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Product out of stock'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                                icon: Icon(Icons.add,
                                    color: Colors.black, size: 16.sp),
                              ),
                            ],
                          ),
                        ),
                        // Removed the duplicate price summary here as it's redundant with the bottom bar and top card
                        // But if design requires it near quantity, we can keep "Delivery" text or similar
                        const PaymShowDisText()
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 2.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Details',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                PaymCalculateCard(
                    widget: widget, quantity: quantity, newPrice: newPrice),
              ],
            ),
          ),
          SizedBox(height: 4.h), // Space for bottom bar
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: productListNotifier,
        builder: (BuildContext context, List<ProductModel> productList,
            Widget? child) {
          if (productList.isEmpty || widget.productIndex >= productList.length)
            return const SizedBox();
          final data = productList[widget.productIndex];
          return PaymConAndPrice(
              newPrice: newPrice,
              data: data,
              widget: widget,
              quantity: quantity);
        },
      ),
    );
  }
}
