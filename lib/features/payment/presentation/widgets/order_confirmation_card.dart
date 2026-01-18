import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

class OrderConfirmationCard extends StatelessWidget {
  final String orderId;
  final String paymentMethod;
  final String dateTime;
  final String totalAmount;
  final VoidCallback onGoToAccount;
  final String title;
  final String buttonText;
  final Widget? icon;

  const OrderConfirmationCard({
    super.key,
    required this.orderId,
    required this.paymentMethod,
    required this.dateTime,
    required this.totalAmount,
    required this.onGoToAccount,
    this.title = "Your order has been successfully submitted",
    this.buttonText = "Go to Home",
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final details = [
      {'label': "Order ID", 'value': orderId},
      {'label': "Payment Method", 'value': paymentMethod},
      {'label': "Date & Time", 'value': dateTime},
      {'label': "Total", 'value': totalAmount, 'isBold': true},
    ];

    return Animate(
      effects: [
        FadeEffect(duration: 400.ms, curve: Curves.easeInOut),
        ScaleEffect(
            begin: const Offset(0.95, 0.95),
            end: const Offset(1, 1),
            duration: 400.ms,
            curve: Curves.easeInOut),
      ],
      child: Container(
        width: 100.w,
        constraints: BoxConstraints(maxWidth: 400),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success Icon
            Animate(
              effects: [
                FadeEffect(delay: 100.ms),
                MoveEffect(
                    begin: const Offset(0, 20),
                    end: Offset.zero,
                    delay: 100.ms,
                    curve: Curves.elasticOut),
              ],
              child: icon ??
                  Icon(
                    LucideIcons.checkCircle2,
                    size: 48,
                    color: Colors.green,
                  ),
            ),
            SizedBox(height: 3.h),

            // Title
            Animate(
              effects: [
                FadeEffect(delay: 200.ms),
                MoveEffect(
                    begin: const Offset(0, 20),
                    end: Offset.zero,
                    delay: 200.ms,
                    curve: Curves.elasticOut),
              ],
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 3.h),

            // Order Details Section
            Animate(
              effects: [
                FadeEffect(delay: 300.ms),
                MoveEffect(
                    begin: const Offset(0, 20),
                    end: Offset.zero,
                    delay: 300.ms,
                    curve: Curves.elasticOut),
              ],
              child: Column(
                children: details.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == details.length - 1;
                  final isBold = item['isBold'] == true;

                  return Container(
                    decoration: BoxDecoration(
                      border: isLast
                          ? null
                          : Border(
                              bottom: BorderSide(
                                  color: Colors.grey.shade200, width: 1)),
                    ),
                    padding: EdgeInsets.only(
                        bottom: isLast ? 0 : 1.5.h,
                        top: index == 0 ? 0 : 1.5.h),
                    margin: EdgeInsets.only(bottom: isLast ? 0 : 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['label'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          item['value'] as String,
                          style: GoogleFonts.inter(
                            fontSize: isBold ? 14.sp : 14.sp,
                            fontWeight:
                                isBold ? FontWeight.bold : FontWeight.normal,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 4.h),

            // Action Button
            Animate(
              effects: [
                FadeEffect(delay: 400.ms),
                MoveEffect(
                    begin: const Offset(0, 20),
                    end: Offset.zero,
                    delay: 400.ms,
                    curve: Curves.elasticOut),
              ],
              child: SizedBox(
                width: double.infinity,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: onGoToAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Primary color assumption
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
