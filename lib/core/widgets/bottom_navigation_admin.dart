import 'package:flutter/material.dart';

import '../../features/admin/presentation/pages/admin_list.dart';
import '../../features/admin/presentation/pages/admin_user_list.dart';
import '../../features/admin/presentation/pages/coupon_screen.dart';
import '../../features/admin/presentation/pages/dashboard.dart';

class BottomNavigationAdmin extends StatefulWidget {
  const BottomNavigationAdmin({super.key});

  @override
  State<BottomNavigationAdmin> createState() => _BottomNavigationAdminState();
}

class _BottomNavigationAdminState extends State<BottomNavigationAdmin> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardScreen(),
    const AdminList(),
    const CouponScreen(),
    const AdminUserListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        fixedColor: const Color.fromARGB(255, 255, 170, 0),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 30,
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 30,
              ),
              label: 'Product'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
                size: 30,
              ),
              label: 'Coupon'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Users'),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
      ),
      body: pages[selectedIndex],
    );
  }
}
