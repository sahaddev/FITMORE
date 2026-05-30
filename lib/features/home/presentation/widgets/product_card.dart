import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../product_details/presentation/pages/product_detiles.dart';

import '../../../../core/models/product/db_product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueNotifier<List<ProductModel>>([]),
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = productList[index];
                final imageBytes = base64.decode(data.image1);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetiles(
                          discription: data.discription,
                          index: data.id!,
                          title: data.title,
                          price: data.price,
                          image: data.image1,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: SizedBox(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: MemoryImage(imageBytes),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 5),
                            child: SizedBox(
                              height: 35,
                              child: Text(
                                data.title,
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 17, 17, 17),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${data.price}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text('Added to Favorite'),
                                          backgroundColor: Colors.grey,
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.favorite_border,
                                        color: Color(0xFFFF4848),
                                        size: 25,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: productList.length,
            ),
          ),
        );
      },
    );
  }
}
