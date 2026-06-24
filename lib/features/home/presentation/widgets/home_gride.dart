import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'package:e_commerce/core/assets/images/app_images.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home/home_bloc.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (message) => const SizedBox(),
          failure: (message) => Center(child: Text(message)),
          loaded: (popularProducts, banners) {
            if (popularProducts.isEmpty) {
              return const Expanded(
                  child: Center(child: Text('No products available')));
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 4.w,
              ),
              itemCount: popularProducts.length,
              itemBuilder: (context, index) {
                final product = popularProducts[index];
                return GestureDetector(
                  onTap: () {
                    NavigationService.pushNamed(
                      AppRouters.productDetails,
                      arguments: {
                        'index': product.id ?? 0,
                        'title': product.title ?? '',
                        'price': product.price ?? 0,
                        'image': product.baseImage ?? '',
                        'discription': product.description ?? '',
                      },
                    );
                  },
                  child: ProductCard(
                    imageUrl: product.baseImage ?? '',
                    name: product.title ?? '',
                    price: '₹${product.price ?? 0}',
                    rating: 4.5, // placeholder
                  ),
                );
              },
            );
          },
        );
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
    if (source.startsWith('http://') || source.startsWith('https://')) {
      return Image.network(
        source,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image);
        },
      );
    }

    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(source);
    } catch (e) {
      imageBytes = null;
    }
    return Image(
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image);
      },
      fit: BoxFit.cover,
      // ignore: unnecessary_null_comparison
      image: imageBytes == null
          ? const AssetImage(AppImages.downloadAddImage)
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
                          fontSize: 14.sp,
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
                    fontSize: 16.sp,
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
