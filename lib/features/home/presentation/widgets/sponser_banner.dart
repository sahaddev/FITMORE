import 'package:flutter/material.dart';
import 'package:e_commerce/core/assets/images/app_images.dart';

class SponserBanner extends StatelessWidget {
  const SponserBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 5),
            child: Image(
              image: AssetImage(AppImages.e7055d032d71f1),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(AppImages.downloadSpo2),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(AppImages.imagesSpo3),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(AppImages.imagesSpo4),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage(AppImages.imagesSpo5),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
