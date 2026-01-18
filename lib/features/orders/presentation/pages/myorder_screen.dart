import 'package:e_commerce/features/orders/presentation/pages/order_deatiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/database/function/order_history.dart';
import '../../../../core/database/models/order_history/order_history_model.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    orderhistoryy.getAllOrders();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Order',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: orderhistoryNotify,
        builder: (BuildContext context, List<OrderhistoryModel> orderList,
            Widget? child) {
          if (orderList.isEmpty) {
            return Center(
              child: Text(
                "No orders found",
                style: GoogleFonts.poppins(fontSize: 14.sp),
              ),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            separatorBuilder: (context, index) => SizedBox(height: 2.h),
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              final data = orderList[index];
              return Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status and Details Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 0.5.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E8F3E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Success",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OrderDeatiles(index: 0),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "See Details",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(Icons.chevron_right, size: 20.sp),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    // Store Info
                    Text(
                      "Caffeine Store Banyumas", // Static for now as not in model
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "to Muna",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Monday, 23 Apr 2024 • 15:44", // Placeholder date
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    // Items
                    Text(
                      "1x ${data.title}",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    const Divider(),
                    SizedBox(height: 1.h),
                    // Footer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1 Item • IDR ${data.price}",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.brown),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Re-Order",
                            style: GoogleFonts.poppins(
                              color: Colors.brown,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
