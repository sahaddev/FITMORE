import 'package:flutter/material.dart';

import '../pages/cart_payment.dart';
import '../pages/payment_last_page.dart';
import '../../../../core/models/cart_/cart_model.dart';

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
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          allow == true
              ? const Text(
                  "\$1234",
                  style: TextStyle(
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
              valueListenable: ValueNotifier<List<CartModel>>([]),
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () async {
                    if (groupValue == 'Now3') {
                      final cardDb = <CartModel>[];

                      cardDb.clear();

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) {
                              final now = DateTime.now();
                              final dateStr = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString().substring(2)} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
                              return PaymentLastScareen(
                                orderId: "OD-${now.millisecondsSinceEpoch.toString().substring(5)}",
                                totalAmount: allow == true ? "\$1234" : "\$${widget.totelPrice}",
                                paymentMethod: groupValue == 'Now3' ? "Cash on Delivery" : "Online Payment",
                                dateTime: dateStr,
                              );
                            },
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
