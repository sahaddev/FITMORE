import 'package:flutter/material.dart';

import '../../components/ui/offer_carousel.dart';
import '../../features/home/presentation/widgets/home_gride.dart';
import '../database/models/product/db_product_model.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({
    super.key,
    required this.foundproduct,
  });

  final ValueNotifier<List<ProductModel>> foundproduct;

  @override
  Widget build(BuildContext context) {
    // Sample data for the carousel
    final List<Offer> sampleOffers = [
      Offer(
        id: 1,
        imageSrc:
            "https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?q=80&w=1966&auto=format&fit=crop",
        imageAlt: "International travel landmarks collage",
        tag: "Discount",
        title: "Up to ₹3000 OFF",
        description: "On International Flights.",
        brandLogoSrc:
            "https://static.twidpay.com/co/mobile_app_images/brand_logos/square/easemytripsquare.png?size=40",
        brandName: "Ease My Trip",
        promoCode: "EMTWID",
        href: "#",
      ),
      Offer(
        id: 2,
        imageSrc:
            "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop",
        imageAlt: "A delicious looking burger",
        tag: "Discount",
        title: "Snack more. Save more.",
        description: "Get ₹75 OFF on purchases of ₹299 or more.",
        brandLogoSrc:
            "https://static.twidpay.com/co/mobile_app_images/brand_logos/square/mcdonaldssquare.png?size=40",
        brandName: "McD",
        promoCode: "TWID75",
        href: "#",
      ),
      Offer(
        id: 3,
        imageSrc:
            "https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?q=80&w=1974&auto=format&fit=crop",
        imageAlt: "Logos of popular streaming services",
        tag: "Discount",
        title: "Flat ₹550 OFF on Timesprime",
        description: "Exclusive offer on Times Prime Membership.",
        brandLogoSrc:
            "https://static.twidpay.com/co/mobile_app_images/brand_logos/square/timesprimesquare.png?size=40",
        brandName: "Timesprime",
        promoCode: "TWID550",
        href: "#",
      ),
      Offer(
        id: 4,
        imageSrc:
            "https://plus.unsplash.com/premium_photo-1728889749470-97eb0a2e2028?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2FzaGJhY2t8ZW58MHx8MHx8fDA%3D?q=80&w=2070&auto=format&fit=crop",
        imageAlt: "A person holding a phone with a payment app",
        tag: "Cashback",
        title: "10% Instant Cashback",
        description: "On RuPay Credit Card transactions.",
        brandLogoSrc:
            "https://static.twidpay.com/co/mobile_app_images/icons/rupay_rcc.png?size=40",
        brandName: "Rupay CC",
        promoCode: "RCC10",
        href: "#",
      ),
      Offer(
        id: 5,
        imageSrc:
            "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop",
        imageAlt: "Gourmet food on a plate",
        tag: "Offer",
        title: "Flat 20% OFF",
        description: "On dining at partner restaurants.",
        brandLogoSrc:
            "https://twidpay.com/assets/new-square-logos/swiggysquare.webp?size=40",
        brandName: "Dineout",
        promoCode: "DINE20",
        href: "#",
      ),
    ];

    return ValueListenableBuilder(
      valueListenable: foundproduct,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        if (productList.isEmpty) {
          // return SingleChildScrollView(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const SizedBox(height: 50),
          //       const Text('Product list is empty'),
          //       const SizedBox(height: 20),

          //     ],
          //   ),
          // );
          return OfferCarousel(offers: sampleOffers);
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
