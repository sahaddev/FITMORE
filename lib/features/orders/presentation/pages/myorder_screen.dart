import 'package:flutter/material.dart';

import '../../../../core/database/function/order_history.dart';
import '../../../../core/widgets/my_order_card.dart';

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
        title: const Text(
          'My Order',
          style: TextStyle(
            color: Color.fromARGB(255, 123, 123, 123),
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: const MyOrderCard(),
    );
  }
}
