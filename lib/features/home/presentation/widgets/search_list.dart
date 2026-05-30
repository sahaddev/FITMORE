import 'package:flutter/material.dart';

import './home_gride.dart';

import '../../../../core/models/product/db_product_model.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({
    super.key,
    required this.foundproduct,
  });

  final ValueNotifier<List<ProductModel>> foundproduct;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: foundproduct,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        if (productList.isEmpty) {
          return const SizedBox();
        } else {
          return GridView.builder(
            itemCount: productList.length,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3.5 / 4),
            itemBuilder: (context, index) {
              final data = productList[index];
              final imageBytes = data.image1;
              return ProductCard(
                imageUrl: imageBytes,
                name: data.title,
                price: data.price.toString(),
                rating: index.toDouble(),
              );
            },
          );
        }
      },
    );
  }
}
