import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/cart_payment_bottom.dart';
import '../../../../core/widgets/pay_card_productdel.dart';
import '../../../../core/widgets/payment_secon_top_banner.dart';
import '../../../../core/widgets/visa_card.dart';
import '../manager/payment_get.dart';
import '../widgets/payment_appbar.dart';
import 'package:e_commerce/core/assets/images/app_images.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';

class CartPaymentScreen extends StatefulWidget {
  final dynamic totelPrice;
  final int index;
  const CartPaymentScreen({
    super.key,
    required this.index,
    required this.totelPrice,
  });

  @override
  State<CartPaymentScreen> createState() => _CartPaymentScreenState();
}

class _CartPaymentScreenState extends State<CartPaymentScreen> {
  final _couponController = TextEditingController();
  String groupValue = 'Yes';
  bool? allow = false;

  @override
  Widget build(BuildContext context) {
    final paymentGet = Get.put(PaymentGet());

    return Scaffold(
      appBar: paymentTitle(context),
      body: RadioGroup<String>(
        groupValue: groupValue,
        onChanged: (value) {
          setState(() {
            groupValue = value!;
          });
        },
        child: ListView(
          children: [
            const TopBannerPaymentSecScr(),
            const SizedBox(height: 10),
            const Divider(thickness: 3),
            const ListTile(
              leading: Radio<String>(
                value: 'Yes',
              ),
              title: Text('UPI'),
              subtitle: Text('Pay by any UPI app'),
              trailing: Padding(
                padding: EdgeInsets.only(right: 30),
                child: SizedBox(
                    width: 35,
                    child: Image(image: AssetImage(AppImages.downloadUpi))),
              ),
            ),
            const ListTile(
              leading: Radio<String>(
                value: 'Now',
              ),
              title: Text('Wallets'),
              trailing: SizedBox(
                  width: 100,
                  child: Image(image: AssetImage(AppImages.imagesPhonepay))),
            ),
            const ListTile(
              leading: Radio<String>(
                value: 'Now1',
              ),
              title: Text('Credit/Debit/ATM Card'),
              subtitle: Text('Add and secure your card as per RBI quidelines'),
            ),
            const ListTile(
              leading: Radio<String>(
                value: 'Now2',
              ),
              title: Text('Net Banking'),
              subtitle: Text(
                  'This instrument has low success,use UPI or cards for better experience'),
            ),
            const ListTile(
              leading: Radio<String>(
                value: 'Now3',
              ),
              title: Text('Cash on Delivery'),
            ),
            const Divider(thickness: 5),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text('Type you code here'),
                        actions: [
                          TextField(
                            controller: _couponController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  paymentGet.checkingCoupon(
                                      totelPrice: widget.totelPrice,
                                      couponController: _couponController,
                                      allow: allow,
                                      context: context);
                                });
                              },
                              child: const Text('Submit')),
                          TextButton(
                              onPressed: () {
                                NavigationService.pop();
                              },
                              child: const Text('Close')),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.add)),
              title: const Text('Add Coupon'),
            ),
            const Divider(thickness: 10),
            CartPayDelCard(widget: widget, allow: allow),
            Container(
              height: 90,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PassingPaymImage(image: AppImages.downloadVisa),
                  PassingPaymImage(image: AppImages.downloadMastercard),
                  PassingPaymImage(image: AppImages.downloadRupa),
                  PassingPaymImage(image: AppImages.downloadRazopay),
                ],
              ),
            ),
            CartPaymBottom(
                allow: allow, widget: widget, groupValue: groupValue),
          ],
        ),
      ),
    );
  }
}
