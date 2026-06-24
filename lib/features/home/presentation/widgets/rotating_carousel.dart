import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home/home_bloc.dart';

class RotatingCarousel extends StatefulWidget {
  const RotatingCarousel({super.key});

  @override
  State<RotatingCarousel> createState() => _RotatingCarouselState();
}

class _RotatingCarouselState extends State<RotatingCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // CSS uses: --w: 100px; --h: 150px;
    // We'll scale relative to screen width.
    final double itemWidth =
        35.w; // Approx 140px on huge phones, smaller on others
    final double itemHeight =
        22.h; // Match the previous carousel height approximately

    // CSS radius: --translateZ: calc((var(--w) + var(--h)) + 0px);
    // 250px roughly.
    final double radius = 35.w + 10.w; // A bit arbitrary, adjustable.

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<String> images = [];
        state.maybeWhen(
          loaded: (products, banners) {
            for (var banner in banners) {
              if (banner.image1 != null && banner.image1!.isNotEmpty) {
                images.add(banner.image1!);
              }
              if (banner.image2 != null && banner.image2!.isNotEmpty) {
                images.add(banner.image2!);
              }
              if (banner.image3 != null && banner.image3!.isNotEmpty) {
                images.add(banner.image3!);
              }
              if (banner.image4 != null && banner.image4!.isNotEmpty) {
                images.add(banner.image4!);
              }
              if (banner.image5 != null && banner.image5!.isNotEmpty) {
                images.add(banner.image5!);
              }
            }
            if (images.length > 5) {
              images = images.sublist(0, 5);
            }
          },
          orElse: () {},
        );

        if (images.isEmpty) {
          return SizedBox(
            height: 30.h,
            width: 100.w,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final List<Widget> prebuiltCards =
            images.map((img) => _buildCard(img)).toList();

        return SizedBox(
          height: 30.h, // Container height including perspective
          width: 100.w,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double rotationValue = _controller.value * 2 * math.pi;

              // Calculate items with their transform data
              final List<_CarouselItem> items = [];
              final int count = images.length;
              final double anglePerItem = 2 * math.pi / count;

              for (int i = 0; i < count; i++) {
                final double baseAngle = i * anglePerItem;
                // The CSS animates 'rotating' which rotates the whole container.
                // Equivalent to adding rotation to each item's base angle in the ring.
                final double currentAngle = baseAngle + rotationValue;

                // Calculate z-depth for sorting.
                // In a standard ring:
                // x = r * sin(a)
                // z = r * cos(a)
                // We want to draw back items first.
                // Closest to viewer is usually when cos(a) is max (if viewing from +Z?)
                // Let's assume simplest: cos(currentAngle)
                // 1.0 is front, -1.0 is back.
                final double zDepth = math.cos(currentAngle);

                items.add(_CarouselItem(
                  index: i,
                  image: images[i],
                  cardWidget: prebuiltCards[i],
                  angle: currentAngle,
                  zDepth: zDepth,
                ));
              }

              // Sort: draw lowest zDepth (back) first, highest zDepth (front) last.
              items.sort((a, b) => a.zDepth.compareTo(b.zDepth));

              return Stack(
                alignment: Alignment.center,
                children: items.map((item) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // Perspective
                      ..translateByDouble(
                          0.0, 0.0, 0.0, 1.0) // Center of rotation
                      ..rotateY(item.angle)
                      ..translateByDouble(
                          0.0, 0.0, radius, 1.0), // Move out to radius
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: itemWidth,
                      height: itemHeight,
                      child: item.cardWidget,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCard(String imagePath) {
    // Replicating the CSS card style if possible
    // .card { border: 2px solid rgba(var(--color-card)); border-radius: 12px; ... }
    // .img { radial-gradient overlay ... }

    Widget imageWidget;
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      imageWidget = Image.network(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    } else if (imagePath.startsWith('assets/')) {
      imageWidget = Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    } else {
      imageWidget = FutureBuilder<Uint8List?>(
        future: compute(decodeBase64InIsolate, imagePath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.isNotEmpty) {
            return Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            );
          } else {
            return const Icon(Icons.broken_image);
          }
        },
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: Colors.white.withValues(alpha: 0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            imageWidget,
            // The radial gradient overlay from CSS
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    const Color(0xFF1da1f2).withValues(alpha: 0.1),
                    const Color(0xFF1da1f2).withValues(alpha: 0.2),
                    const Color(0xFF1da1f2).withValues(alpha: 0.3),
                  ],
                  stops: const [0.0, 0.8, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarouselItem {
  final int index;
  final String image;
  final Widget cardWidget;
  final double angle;
  final double zDepth;

  _CarouselItem({
    required this.index,
    required this.image,
    required this.cardWidget,
    required this.angle,
    required this.zDepth,
  });
}

Uint8List? decodeBase64InIsolate(String base64Str) {
  try {
    if (base64Str.startsWith('data:image')) {
      base64Str = base64Str.split(',').last;
    }
    // Remove whitespaces just in case
    base64Str = base64Str.replaceAll(RegExp(r'\s+'), '');
    return base64Decode(base64Str);
  } catch (e) {
    return null;
  }
}
