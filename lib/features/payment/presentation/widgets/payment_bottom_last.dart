import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/payment_get.dart';
import '../pages/patment_scr_two.dart';

import '../../../../core/models/product/db_product_model.dart';

class PaymContiAndPriceLastScr extends StatelessWidget {
  const PaymContiAndPriceLastScr({
    super.key,
    required this.allow,
    required this.widget,
    required this.groupValue,
  });

  final bool? allow;
  final PaymentScreenTwo widget;

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
                  '\$${paymentGet.afterdicount(widget.price, allow!)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(
            width: 150,
            child: ValueListenableBuilder(
              valueListenable: ValueNotifier<List<ProductModel>>([]),
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                final data = productList[widget.productIndex];
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () {
                    if (groupValue == 'Now3') {
                      paymentGet.addToOrderHistory(
                          productCount: data.productCount,
                          context: context,
                          imagee: widget.image,
                          titlee: widget.title,
                          pricee: widget.price);
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
