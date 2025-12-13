import 'package:e_commerce/application/features/home/widgets/category_section.dart';
import 'package:e_commerce/application/features/home/widgets/clearance_bar.dart';
import 'package:e_commerce/application/features/home/widgets/home_gride.dart';
import 'package:e_commerce/application/features/home/widgets/search_bar.dart';
import 'package:e_commerce/application/features/notification/ui/notification_ui.dart';
import 'package:e_commerce/screens/user/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'asset/images-b5.jpg',
      'asset/images-6.jpg',
      'asset/images-b3.jpg',
      'asset/images-b4.jpg',
      'asset/images-b1.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 12.w, // About 45-50px
                          width: 12.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'asset/images-b5.jpg'), // Placeholder avatar
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello Alex',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Good Morning!',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _buildHeaderIcon(Icons.notifications_outlined,
                            onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ListOfNotification()));
                        }),
                        SizedBox(width: 2.w),
                        _buildHeaderIcon(Icons.shopping_bag_outlined,
                            onTap: () {
                          // Navigate to Cart or Bag
                        }),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 3.h),

                // Search Bar
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
                  },
                  child: const CusSearchBar(),
                ),
                SizedBox(height: 3.h),

                // Categories
                const CategoriesSection(),
                SizedBox(height: 3.h),

                // Banner
                CarouselSlider(
                  items: imageList.map((image) {
                    return ClearanceBanner(image: image);
                  }).toList(),
                  options: CarouselOptions(
                    height: 22.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                  ),
                ),
                SizedBox(height: 3.h),

                // Popular Product Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Product",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ));
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),

                // Grid
                const ProductsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10.w,
        width: 10.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Icon(icon, size: 16.sp, color: Colors.black),
      ),
    );
  }
}

// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//         BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//       selectedItemColor: Colors.green,
//       unselectedItemColor: Colors.grey,
//       type: BottomNavigationBarType.fixed,
//     );
//   }
// }
