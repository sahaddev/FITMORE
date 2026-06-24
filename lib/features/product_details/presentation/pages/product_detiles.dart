import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/models/product/db_product_model.dart';
import '../widgets/bottom_part.dart';
import '../widgets/middle_part.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_details/product_details_bloc.dart';

// ignore: must_be_immutable
class ProductDetiles extends StatefulWidget {
  int index;
  String title;
  int price;
  String image;
  String discription;

  ProductDetiles({
    super.key,
    required this.index,
    required this.title,
    required this.price,
    required this.image,
    required this.discription,
  });

  @override
  State<ProductDetiles> createState() => _ProductDetilesState();
}

class _ProductDetilesState extends State<ProductDetiles> {
  int selectedImage = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsBloc>().add(LoadProductDetails(id: widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () => NavigationService.pop(),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey[300]!)),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              bool isFavorite = false;
              state.maybeWhen(
                loaded: (_, fav, __) => isFavorite = fav,
                orElse: () {},
              );
              return GestureDetector(
                onTap: () async {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  final product = ProductModel(
                    title: widget.title,
                    discription: widget.discription,
                    image1: widget.image,
                    image2: '',
                    image3: '',
                    image4: '',
                    price: widget.price,
                    category: '',
                    productCount: 1,
                  );
                  context
                      .read<ProductDetailsBloc>()
                      .add(ToggleFavorite(product));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 33,
                  width: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey[300]!)),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 33,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey[300]!)),
            child: const Icon(
              Icons.card_travel_outlined,
              size: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (BuildContext context, state) {
                return state.maybeWhen(
                  loaded: (productList, isFavorite, isInCart) {
                    final product = productList.isNotEmpty ? productList.first : null;
                    final images = <String>[];
                    if (product != null) {
                      if (product.image1.isNotEmpty) images.add(product.image1);
                      if (product.image2.isNotEmpty) images.add(product.image2);
                      if (product.image3.isNotEmpty) images.add(product.image3);
                      if (product.image4.isNotEmpty) images.add(product.image4);
                    }
                    if (images.isEmpty && widget.image.isNotEmpty) {
                      images.add(widget.image);
                    }

                    return Column(
                      children: [
                        if (images.isNotEmpty)
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 250,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: images.length > 1,
                              viewportFraction: 0.8,
                            ),
                            items: images.map((img) {
                              String cleanImg = img;
                              if (!img.startsWith('http')) {
                                if (img.startsWith('data:image')) {
                                  cleanImg = img.split(',').last;
                                }
                                cleanImg = cleanImg.replaceAll(RegExp(r'\s+'), '');
                              }
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: img.startsWith('http')
                                    ? Image.network(
                                        img,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
                                      )
                                    : Image.memory(
                                        base64Decode(cleanImg),
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
                                      ),
                              );
                            }).toList(),
                          )
                        else
                          SizedBox(
                            height: 200,
                            child: const Icon(Icons.image, size: 100),
                          ),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                  failure: (message) => Center(
                    child: Text('Error: $message', style: const TextStyle(color: Colors.red)),
                  ),
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
            const SizedBox(height: 15),
            CusMiddle(
                title: widget.title,
                price: widget.price.toString(),
                discription: widget.discription),
            const Spacer(),
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                bool isInCart = false;
                state.maybeWhen(
                  loaded: (_, __, inCart) => isInCart = inCart,
                  orElse: () {},
                );
                return Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!isInCart) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        final product = ProductModel(
                          title: widget.title,
                          discription: widget.discription,
                          image1: widget.image,
                          image2: '',
                          image3: '',
                          image4: '',
                          price: widget.price,
                          category: '',
                          productCount: 1,
                        );
                        context
                            .read<ProductDetailsBloc>()
                            .add(AddToCart(product));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to Cart'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: isInCart
                          ? Colors.grey
                          : const Color.fromARGB(255, 92, 177, 94),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                    ),
                    child: Text(
                      isInCart ? 'In Cart' : 'Add To Cart',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            CusBottom(
                price: widget.price.toString(),
                buttonFun: () {
                  NavigationService.pushNamed(AppRouters.paymentAddress,
                      arguments: {'productIndex': widget.index});
                }),
          ],
        ),
      ),
    );
  }

  GestureDetector imageSmallBox(index, List<Uint8List> demoImage) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Container(
          padding: const EdgeInsets.all(1),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      selectedImage == index ? Colors.red : Colors.transparent),
              color: const Color.fromARGB(255, 202, 200, 200),
              borderRadius: BorderRadius.circular(5)),
          child: Image(
            fit: BoxFit.fill,
            image: MemoryImage(
              demoImage[index],
            ),
          ),
        ),
      ),
    );
  }
}
