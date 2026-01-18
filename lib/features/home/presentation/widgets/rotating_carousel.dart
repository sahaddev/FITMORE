import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RotatingCarousel extends StatefulWidget {
  final List<String> images;

  const RotatingCarousel({super.key, required this.images});

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

    return SizedBox(
      height: 30.h, // Container height including perspective
      width: 100.w,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double rotationValue = _controller.value * 2 * math.pi;

          // Calculate items with their transform data
          final List<_CarouselItem> items = [];
          final int count = widget.images.length;
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
              image: widget.images[i],
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
                  ..translate(0.0, 0.0, 0.0) // Center of rotation
                  ..rotateY(item.angle)
                  ..translate(0.0, 0.0, radius), // Move out to radius
                alignment: Alignment.center,
                child: SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: _buildCard(item.image),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildCard(String imagePath) {
    // Replicating the CSS card style if possible
    // .card { border: 2px solid rgba(var(--color-card)); border-radius: 12px; ... }
    // .img { radial-gradient overlay ... }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
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
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            // The radial gradient overlay from CSS
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    const Color(0xFF1da1f2).withOpacity(0.1),
                    const Color(0xFF1da1f2).withOpacity(0.2),
                    const Color(0xFF1da1f2).withOpacity(0.3),
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
  final double angle;
  final double zDepth;

  _CarouselItem({
    required this.index,
    required this.image,
    required this.angle,
    required this.zDepth,
  });
}
