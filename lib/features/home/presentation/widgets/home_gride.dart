import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../components/ui/offer_carousel.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Optional: Title if needed, matching the demo
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        //   child: Text(
        //     "Deals of the Day",
        //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //   ),
        // ),
        OfferCarousel(offers: sampleOffers),
      ],
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
