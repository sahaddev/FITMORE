import 'package:flutter/material.dart';

import '../widgets/order_confirmation_card.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

class PaymentLastScareen extends StatefulWidget {
  const PaymentLastScareen({super.key});

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
              orderId: "57625869",
              paymentMethod: "Apple Pay",
              dateTime: "01/02/24 23:46",
              totalAmount: "\$ 129",
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
