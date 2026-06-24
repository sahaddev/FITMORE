import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/home/home_bloc.dart';
import '../widgets/search_bar.dart';
import '../widgets/home_gride.dart'; // ProductsGrid

class ProductListingUi extends StatefulWidget {
  const ProductListingUi({super.key});

  @override
  State<ProductListingUi> createState() => _ProductListingUiState();
}

class _ProductListingUiState extends State<ProductListingUi> {
  @override
  void initState() {
    super.initState();
    // Use this event to fetch data
    context.read<HomeBloc>().add(const FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "All Products",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CusSearchBar(),
                SizedBox(height: 3.h),
                const ProductsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
