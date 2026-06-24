import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../blocs/home/home_bloc.dart';

class CusSearchBar extends StatefulWidget {
  const CusSearchBar({super.key});

  @override
  State<CusSearchBar> createState() => _CusSearchBarState();
}

class _CusSearchBarState extends State<CusSearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<HomeBloc>().add(FetchData(search: query));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 6.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              onChanged: _onSearchChanged,
              onSubmitted: (value) {
                _debounce?.cancel();
                context.read<HomeBloc>().add(FetchData(search: value));
              },
              decoration: InputDecoration(
                hintText: 'Search..',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                  size: 18.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 1.5.h),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
