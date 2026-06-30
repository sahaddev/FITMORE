import 'package:flutter/material.dart';

import '../widgets/payment_addres_card.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/payment_address/payment_address_bloc.dart';

class PaymentAddress extends StatefulWidget {
  final int productIndex;

  const PaymentAddress({required this.productIndex, super.key});

  @override
  State<PaymentAddress> createState() => _PaymentAddressState();
}

class _PaymentAddressState extends State<PaymentAddress> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentAddressBloc>().add(const LoadPaymentAddress());
  }

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
      body: PaymentAddrescard(productIndex: widget.productIndex),
    );
  }
}
