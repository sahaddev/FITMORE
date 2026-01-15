import 'package:flutter/material.dart';

import '../../../../core/database/function/product_db_function.dart';
import '../../../../core/database/models/product/db_product_model.dart';
import '../../../../core/widgets/category_card.dart';

class CategotyList extends StatelessWidget {
  final String category;
  const CategotyList({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          category,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: productListNotifier,
        builder: (BuildContext context, List<ProductModel> productList,
            Widget? child) {
          final categoryProducts = productList
              .where((product) => product.category == category)
              .toList();
          return CatogeryCard(categoryProducts: categoryProducts);
        },
      ),
    );
  }
}
