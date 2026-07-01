import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:e_commerce/features/orders/presentation/blocs/my_order/my_order_bloc.dart';
import 'package:e_commerce/features/orders/domain/entities/order_entity.dart';

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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          allow == true
              ? const Text(
                  "\$1234",
//                   '\$${paymentGet.afterdicount(widget.price, allow!)}',
                  style: TextStyle(
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
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () {
                    if (groupValue == 'Now3') {
                      final now = DateTime.now();
                      final order = OrderEntity(
                        id: "OD-${now.millisecondsSinceEpoch.toString().substring(5)}",
                        userId: 0,
                        products: [
                          OrderProductEntity(
                            productId: widget.productIndex.toString(),
                            quantity: widget.quantity,
                            price: widget.price.toDouble(),
                            productName: widget.title,
                          )
                        ],
                        totalAmount: allow == true ? 1234.0 : widget.price.toDouble(),
                        shippingAddress: "Home Address",
                        paymentMethod: "Cash on Delivery",
                        status: "pending",
                        createdAt: now,
                      );
                      
                      context.read<MyOrderBloc>().add(ReOrder(order));

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: const Column(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 60),
                              SizedBox(height: 10),
                              Text('Purchase Successful',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          content: const Text(
                            'Your order has been placed successfully!',
                            textAlign: TextAlign.center,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRouters.bottomNav, (route) => false);
                              },
                              child: const Text('OK',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      );
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
