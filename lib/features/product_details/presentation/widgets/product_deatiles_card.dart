import 'package:flutter/material.dart';

import '../pages/product_detiles.dart';
import '../../../../core/models/product/db_product_model.dart';

class ProductDetiCard extends StatelessWidget {
  const ProductDetiCard({
    super.key,
    required this.widget,
  });

  final ProductDetiles widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ValueListenableBuilder(
          valueListenable: ValueNotifier<List<ProductModel>>([]),
          builder: (BuildContext context, List<ProductModel> productList,
              Widget? child) {
            if (productList.isEmpty) return const SizedBox();
            final data = productList[widget.index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${data.price}',
                      style: const TextStyle(
                        color: Color(0xFFFF4848),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 232, 232),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Added to Favorite'),
                                backgroundColor: Colors.grey,
                              ));
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Color(0xFFFF4848),
                              size: 30,
                            )),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: SizedBox(
                    height: 90,
                    width: 200,
                    child: Text(
                      data.discription,
                      maxLines: 4,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
