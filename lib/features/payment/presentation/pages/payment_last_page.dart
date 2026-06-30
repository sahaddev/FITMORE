import 'package:flutter/material.dart';

import '../widgets/order_confirmation_card.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

class PaymentLastScareen extends StatefulWidget {
  final String orderId;
  final String totalAmount;
  final String paymentMethod;
  final String dateTime;

  const PaymentLastScareen({
    required this.orderId,
    required this.totalAmount,
    required this.paymentMethod,
    required this.dateTime,
    super.key,
  });

  @override
  State<PaymentLastScareen> createState() => _PaymentLastScareenState();
}

class _PaymentLastScareenState extends State<PaymentLastScareen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background color
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: OrderConfirmationCard(
              orderId: widget.orderId,
              paymentMethod: widget.paymentMethod,
              dateTime: widget.dateTime,
              totalAmount: widget.totalAmount,
              onGoToAccount: () {
                NavigationService.pushNamedAndRemoveUntil(AppRouters.bottomNav);
              },
            ),
          ),
        ),
      ),
    );
  }
}
