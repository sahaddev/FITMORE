import 'package:flutter/material.dart';
import 'package:e_commerce/core/assets/images/app_images.dart';

class Splashcontent extends StatelessWidget {
  final String? text, image;
  const Splashcontent({
    this.text,
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const SizedBox(
          height: 150,
          width: 190,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                  AppImages.photo20231026200837RemovebgPreview1)),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color.fromARGB(255, 151, 150, 150)),
        ),
        const Spacer(flex: 2),
        Image(
          image: AssetImage(image!),
          height: 265,
          width: 235,
        )
      ],
    );
  }
}
