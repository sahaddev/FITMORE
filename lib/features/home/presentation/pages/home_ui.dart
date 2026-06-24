import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../widgets/category_section.dart';
import '../widgets/rotating_carousel.dart';
import '../widgets/home_gride.dart';
import '../widgets/search_bar.dart';
import 'package:e_commerce/core/assets/images/app_images.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home/home_bloc.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const FetchData());
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      AppImages.chatgptImageJan182026030134Pm,
      AppImages.chatgptImageJan182026030446Pm,
      AppImages.chatgptImageJan182026030134Pm,
      AppImages.chatgptImageJan182026030446Pm,
      AppImages.chatgptImageJan182026030134Pm,
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
                                  AppImages.imagesB5), // Placeholder avatar
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
                                fontSize: 14.sp,
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
                          NavigationService.pushNamed(AppRouters.notification);
                        }),
                        SizedBox(width: 2.w),
                        _buildHeaderIcon(Icons.shopping_bag_outlined,
                            onTap: () {
                          NavigationService.pushNamed(AppRouters.cart);
                        }),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 3.h),

                // Search Bar
                const CusSearchBar(),
                SizedBox(height: 3.h),

                // Categories
                const CategoriesSection(),
                SizedBox(height: 3.h),

                // Banner
                // Banner
                RotatingCarousel(images: imageList),
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
                        NavigationService.pushNamed(AppRouters.productListing);
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
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
