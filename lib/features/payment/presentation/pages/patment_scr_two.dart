import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/paym_last_product_del.dart';
import '../../../../core/widgets/payment_bottom_last.dart';
import '../../../../core/widgets/payment_secon_top_banner.dart';
import '../../../../core/widgets/visa_card.dart';
import '../manager/payment_get.dart';
import '../widgets/payment_appbar.dart';
import 'package:e_commerce/components/ui/payment_method_selector.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PaymentScreenTwo extends StatefulWidget {
  final int price;
  final int quantity;
  final String image;
  final String title;
  final int productIndex;

  const PaymentScreenTwo({
    required this.price,
    required this.productIndex,
    required this.quantity,
    required this.image,
    required this.title,
    super.key,
  });

  @override
  State<PaymentScreenTwo> createState() => _PaymentScreenTwoState();
}

class _PaymentScreenTwoState extends State<PaymentScreenTwo> {
  final _couponController = TextEditingController();
  String groupValue = 'Yes';
  bool? allow = false;

  @override
  Widget build(BuildContext context) {
    final paymentGet = Get.put(PaymentGet());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: paymentTitle(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopBannerPaymentSecScr(),
                    SizedBox(height: 3.h),

                    PaymentMethodSelector(
                      title: 'Payment Method',
                      actionText: '',
                      onActionClick: () {
                        // TODO: Implement add new method
                      },
                      defaultSelectedId: groupValue,
                      onSelectionChange: (id) {
                        setState(() {
                          groupValue = id;
                        });
                      },
                      methods: [
                        PaymentMethod(
                          id: 'Yes',
                          label: 'UPI',
                          description: 'Pay by any UPI app',
                          icon: Image.asset('asset/download(UPI).png',
                              errorBuilder: (c, e, s) =>
                                  const Icon(LucideIcons.smartphone)),
                        ),
                        PaymentMethod(
                          id: 'Now',
                          label: 'Wallets',
                          description: 'PhonePe, GPay, Paytm',
                          icon: Image.asset('asset/images(Phonepay).png',
                              errorBuilder: (c, e, s) =>
                                  const Icon(LucideIcons.wallet)),
                        ),
                        PaymentMethod(
                          id: 'Now1',
                          label: 'Credit/Debit/ATM Card',
                          description:
                              'Add and secure your card as per RBI guidelines',
                          icon: const Icon(LucideIcons.creditCard,
                              color: Colors.black87),
                        ),
                        PaymentMethod(
                          id: 'Now2',
                          label: 'Net Banking',
                          description:
                              'This instrument has low success, use UPI or cards',
                          icon: const Icon(LucideIcons.landmark,
                              color: Colors.black87),
                        ),
                        PaymentMethod(
                          id: 'Now3',
                          label: 'Cash on Delivery',
                          description: 'Pay when you receive the order',
                          icon: const Icon(LucideIcons.banknote,
                              color: Colors.black87),
                        ),
                      ],
                    ),

                    SizedBox(height: 3.h),
                    const Divider(thickness: 1),
                    SizedBox(height: 2.h),

                    _buildCouponSection(context, paymentGet),

                    SizedBox(height: 3.h),

                    PaymentLastScrDelCard(
                      widget: widget,
                      allow: allow,
                    ),

                    SizedBox(height: 2.h),

                    // Footer Icons
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PassingPaymImage(image: 'asset/download(Visa).png'),
                          PassingPaymImage(
                              image: 'asset/download(MAsterCard).png'),
                          PassingPaymImage(image: 'asset/download(Rupa).png'),
                          PassingPaymImage(
                              image: 'asset/download(Razopay).png'),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                            12.h), // Bottom padding for floating button area
                  ],
                ),
              ),
            ),
            PaymContiAndPriceLastScr(
              allow: allow,
              widget: widget,
              groupValue: groupValue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponSection(BuildContext context, PaymentGet paymentGet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        onTap: () {
          _showCouponDialog(context, paymentGet);
        },
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.confirmation_number_outlined,
              color: Colors.black, size: 20),
        ),
        title: Text(
          'Have a Coupon Code?',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          'Apply',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  void _showCouponDialog(BuildContext context, PaymentGet paymentGet) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.ticket,
                    size: 32, color: Colors.blue),
              ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),

              SizedBox(height: 2.h),

              Text(
                'Add Coupon Code',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the code below to get discounts on your purchase.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey.shade500,
                ),
              ),

              SizedBox(height: 3.h),

              // Input Field
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: TextField(
                  controller: _couponController,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    hintText: 'e.g. SAVE20',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.grey.shade400,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 3.h),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          paymentGet.checkingCoupon(
                            totelPrice: widget.price,
                            couponController: _couponController,
                            allow: allow,
                            context: context,
                          );
                        });
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF0F172A),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Apply',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            .animate()
            .slideY(
                begin: 0.1,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOutCubic)
            .fadeIn(duration: 400.ms),
      ),
    );
  }
}
