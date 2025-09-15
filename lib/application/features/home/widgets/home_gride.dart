import 'package:e_commerce/application/features/deatile/ui/product_detiles.dart';
import 'package:e_commerce/service/model/product_model.dart';
import 'package:e_commerce/service/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ProductService().getProducts(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final productList = snapshot.data;
            if (productList.isEmpty) {
              return Center(
                child: Text(
                  'List is empty',
                  style: GoogleFonts.roboto(),
                ),
              );
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
                  final Product data = productList[index];
                  final image = data.image1;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetiles(
                              index: data.id,
                              title: data.title,
                              price: data.price as int,
                              discription: data.discription,
                              image: data.image1)));
                    },
                    child: ProductCard(
                      imageUrl: image,
                      name: data.title,
                      price: data.price.toString(),
                      rating: index.toDouble(),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,
                        style: GoogleFonts.aBeeZee(
                            color: Colors.grey[500], fontSize: 12)),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(rating.toString(),
                            style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                Text(price,
                    style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
