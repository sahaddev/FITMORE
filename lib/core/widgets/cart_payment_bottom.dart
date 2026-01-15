import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../features/payment/presentation/manager/payment_get.dart';
import '../../features/payment/presentation/pages/cart_payment.dart';
import '../../features/payment/presentation/pages/payment_last_page.dart';
import '../database/function/cart_function.dart';
import '../database/function/order_history.dart';
import '../database/models/cart_/cart_model.dart';
import '../database/models/order_history/order_history_model.dart';

class CartPaymBottom extends StatelessWidget {
  const CartPaymBottom({
    super.key,
    required this.allow,
    required this.widget,
    required this.groupValue,
  });

  final bool? allow;
  final CartPaymentScreen widget;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    final paymentGet = Get.put(PaymentGet());
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          allow == true
              ? Text(
                  '\$${paymentGet.afterdicount(widget.totelPrice, allow!)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  '\$${widget.totelPrice}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(
            width: 150,
            child: ValueListenableBuilder(
              valueListenable: cartvaluelisener,
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () async {
                    if (groupValue == 'Now3') {
                      final cardDb = await Hive.openBox<CartModel>('cart_db');

                      for (var i = 0; i < cardDb.length; i++) {
                        final data = cartList[i];
                        final order = OrderhistoryModel(
                          image: data.image,
                          title: data.title,
                          price: data.price,
                        );
                        orderhistoryy.addOrderHistory(order);
                      }
                      cardDb.clear();

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const PaymentLastScareen(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
