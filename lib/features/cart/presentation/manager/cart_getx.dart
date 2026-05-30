import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/cart_/cart_model.dart';
import '../../../../core/models/product/db_product_model.dart';

class CartGet extends GetxController {
  int totelPriceShare = 0;

  Future<void> countLessing(
      {quantityy, pricee, titlee, imagee, idd, count}) async {
    int quantity = quantityy ?? 0;

    if (quantity > 1) {
      quantity = quantity - 1;
    }
  }

  Future<void> countAdding(
      {quantityy, pricee, titlee, imagee, idd, context}) async {
    final productDB = <ProductModel>[];

    int count = 0;
    for (var i = 0; i < productDB.length; i++) {
      final currentProduct = productDB[i];
      if (currentProduct.id == idd) {
        count = currentProduct.productCount;
      }
    }
    int quantity = quantityy ?? 0;

    if (count > quantity) {
      quantity = quantity + 1;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('product out of stock'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<String> getTotelPrice() async {
    int totelPrice = 0;

    final cartDB = <CartModel>[];

    for (var i = 0; i < cartDB.length; i++) {
      final currentProduct = cartDB[i];
      totelPrice = totelPrice + currentProduct.newPrice;
    }
    totelPriceShare = totelPrice;
    return '\$$totelPrice.00';
  }

  Future<String> discoundCalculator() async {
    final cartDB = <CartModel>[];
    num totelPrice = 0;
    for (var i = 0; i < cartDB.length; i++) {
      final currentProduct = cartDB[i];
      totelPrice += currentProduct.newPrice;
    }
    num discountedAmount = (5 / 100) * totelPrice;
    discountedAmount.toInt();
    return '\$${discountedAmount.toInt()}';
  }

  Future<String> afterDiscounting() async {
    final cartDB = <CartModel>[];
    num totelPrice = 0;
    for (var i = 0; i < cartDB.length; i++) {
      final currentProduct = cartDB[i];
      totelPrice += currentProduct.newPrice;
    }
    num discountedAmount = (5 / 100) * totelPrice;
    num afterDisAmount = totelPrice - discountedAmount;
    return '\$$afterDisAmount';
  }
}
