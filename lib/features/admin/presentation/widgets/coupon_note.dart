import 'package:e_commerce/core/models/coupon/coupon_model.dart';
import 'package:flutter/material.dart';


class CouponNote extends StatelessWidget {
  const CouponNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueNotifier<List<CouponModel>>([]),
      builder:
          (BuildContext context, List<CouponModel> couponList, Widget? child) {
        return ListView.separated(
          itemCount: couponList.length,
          separatorBuilder: (context, index) => const Divider(thickness: 3),
          itemBuilder: (context, index) {
            final data = couponList[index];
            return ListTile(
              title: Text(data.code),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red,
                ),
                onPressed: () {
                  
                },
              ),
            );
          },
        );
      },
    );
  }
}

Future<bool> addingCoupon(BuildContext context, couponCodeController) async {
  final couponDB = <CouponModel>[];
  final code = couponCodeController.text;
  // ignore: unnecessary_null_comparison
  if (couponDB != null) {
    for (var i = 0; i < couponDB.length; i++) {
      final currentCode = couponDB[i];
      if (currentCode.code == code) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.grey,
          margin: EdgeInsets.all(15),
          content: Text('Code already added'),
        ));
        return false;
      }
    }
  }
  return true;
}
