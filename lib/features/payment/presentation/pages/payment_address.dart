import 'package:flutter/material.dart';

import '../../../../core/widgets/payment_addres_card.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';

class PaymentAddress extends StatelessWidget {
  final int productIndex;

  const PaymentAddress({required this.productIndex, super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Shipping Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            NavigationService.pop();
          },
          icon: const Icon(Icons.chevron_left),
          color: Colors.black,
          iconSize: 35,
        ),
      ),
      body: PaymentAddrescard(productIndex: productIndex),
    );
  }
}
