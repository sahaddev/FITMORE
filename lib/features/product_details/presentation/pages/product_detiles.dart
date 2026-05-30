import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/models/product/db_product_model.dart';
import '../widgets/bottom_part.dart';
import '../widgets/middle_part.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

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
  late bool isFavorite;

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
          ValueListenableBuilder(
            valueListenable: ValueNotifier(null),
            builder: (context, box, child) {
              return GestureDetector(
                onTap: () async {
                  ScaffoldMessenger.of(context).clearSnackBars();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 33,
                  width: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey[300]!)),
                  child: const Icon(
                    Icons.heart_broken,
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
            ValueListenableBuilder(
              valueListenable: ValueNotifier<List<ProductModel>>([]),
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                final data = productList[widget.index];
                final base64Image1 = data.image1;
                final base64Image2 = data.image2;
                final base64Image3 = data.image3;
                final base64Image4 = data.image4;
                // ignore: unused_local_variable
                Uint8List imageBytes;
                List<Uint8List> demoImage = [
                  imageBytes = base64.decode(base64Image1),
                  imageBytes = base64.decode(base64Image2),
                  imageBytes = base64.decode(base64Image3),
                  imageBytes = base64.decode(base64Image4),
                ];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width * .6,
                        child: Image(
                          image: MemoryImage(demoImage[selectedImage]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                          4,
                          (index1) => imageSmallBox(index1, demoImage),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
            CusMiddle(
                title: widget.title,
                price: widget.price.toString(),
                discription: widget.discription),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: ValueNotifier(null),
              builder: (context, box, child) {
                const isInCart = null != null;
                return Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).clearSnackBars();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to Cart'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color.fromARGB(255, 92, 177, 94),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                    ),
                    child: Text(
                      isInCart == true ? 'Go to Cart' : 'Add To Cart',
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
