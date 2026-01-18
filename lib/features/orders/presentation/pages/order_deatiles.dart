import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

class OrderDeatiles extends StatelessWidget {
  final int index;
  const OrderDeatiles({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Demo data mimicking the provided React component's demoStates
    final demoStates = [
      OrderStateModel(
        status: "Order Placed",
        icon: LucideIcons.shoppingCart,
        description: "Your order has been placed",
        isActive: true,
      ),
      OrderStateModel(
        status: "Processing",
        icon: LucideIcons.clock,
        description: "We're processing your order",
        isActive: true,
      ),
      OrderStateModel(
        status: "Packed",
        icon: LucideIcons.package,
        description: "Your order has been packed",
        isActive: false,
      ),
      OrderStateModel(
        status: "Shipped",
        icon: LucideIcons.truck,
        description: "Your order is on the way",
        isActive: false,
      ),
      OrderStateModel(
        status: "Delivered",
        icon: LucideIcons.checkCircle,
        description: "Your order has been delivered",
        isActive: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #123456789',
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Tracking History',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: demoStates.length,
                separatorBuilder: (context, index) => SizedBox(height: 1.5.h),
                itemBuilder: (context, index) {
                  final state = demoStates[index];
                  return OrderStateCard(state: state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStateModel {
  final String status;
  final IconData icon;
  final String description;
  final bool isActive;

  OrderStateModel({
    required this.status,
    required this.icon,
    required this.description,
    required this.isActive,
  });
}

class OrderStateCard extends StatelessWidget {
  final OrderStateModel state;

  const OrderStateCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    // Define colors to match the "shadcn" look
    // Active: bg-primary (using black for a modern/premium look or a specific primary color)
    // Inactive: border-border (grey border)

    // activeBgColor can be set to Theme.of(context).primaryColor if preferred

    // Assuming a dark primary color for contrast if isActive, or use a specific color like blue/black
    final activeBgColor = Colors.black;
    final activeTextColor = Colors.white;
    final inactiveBorderColor = Colors.grey.shade300;

    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: state.isActive ? activeBgColor : Colors.transparent,
        border: Border.all(
          color: state.isActive ? activeBgColor : inactiveBorderColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: state.isActive
                  ? activeTextColor
                  : Colors.black, // Inverted for contrast
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              state.icon,
              size: 7.w,
              color: state.isActive ? activeBgColor : activeTextColor,
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.status,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: state.isActive ? activeTextColor : Colors.black87,
                  ),
                ),
                Text(
                  state.description,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: state.isActive
                        ? activeTextColor.withOpacity(0.8)
                        : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
