import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/database/function/product_db_function.dart';
import '../../../../core/database/models/product/db_product_model.dart';
import '../../../product_details/presentation/pages/product_detiles.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  void initState() {
    super.initState();
    productt.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: productListNotifier,
      builder: (
        BuildContext context,
        List<ProductModel> productList,
        Widget? child,
      ) {
        if (productList.isEmpty) {
          return Center(
            child: Text(
              'List is empty',
              style: GoogleFonts.roboto(),
            ),
          );
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productList.length,
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 4.w,
                childAspectRatio: 0.75),
            itemBuilder: (context, index) {
              final ProductModel data = productList[index];
              final image = data.image1;
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetiles(
                          index: data.id ?? 0,
                          title: data.title,
                          price: data.price,
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
      },
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

  Widget _buildImage(String source) {
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(source);
    } catch (e) {
      imageBytes = null;
    }
    return Image(
      errorBuilder: (context, error, stackTrace) {
        log(error.toString());
        return const Icon(Icons.broken_image);
      },
      fit: BoxFit.cover,
      // ignore: unnecessary_null_comparison
      image: imageBytes == null
          ? const AssetImage('asset/download(add image).png')
              as ImageProvider<Object>
          : MemoryImage(imageBytes),
    );
  }

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
                  child: _buildImage(imageUrl)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.aBeeZee(
                          color: Colors.grey[500],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16.sp),
                        SizedBox(width: 1.w),
                        Text(
                          rating.toString(),
                          style: GoogleFonts.roboto(
                            color: Colors.black45,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  price,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
