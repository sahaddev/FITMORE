import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import '../blocs/my_order/my_order_bloc.dart';
import 'package:intl/intl.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyOrderBloc>().add(const GetAllOrders());
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<MyOrderBloc, MyOrderState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (orderList) {
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
                  final productName = data.products.isNotEmpty
                      ? data.products.first.productName ?? 'Product'
                      : 'Unknown Product';
                  final itemCount = data.products.fold(
                      0, (sum, item) => sum + item.quantity);
                  final formattedDate =
                      DateFormat('EEEE, dd MMM yyyy • HH:mm').format(data.createdAt);

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
                                data.status,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                NavigationService.pushNamed(AppRouters.orderDetails,
                                    arguments: {'index': index}); // Pass data.id if needed
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
                          "to ${data.shippingAddress}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          formattedDate,
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        // Items
                        Text(
                          "${data.products.isNotEmpty ? data.products.first.quantity : 0}x $productName",
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
                                  "$itemCount Item${itemCount > 1 ? 's' : ''} • IDR ${data.totalAmount}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            OutlinedButton(
                              onPressed: () {
                                context.read<MyOrderBloc>().add(ReOrder(data));
                              },
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
            failure: (message) => Center(
              child: Text(
                message,
                style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.red),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
