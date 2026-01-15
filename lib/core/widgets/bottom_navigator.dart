import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/favorite/presentation/pages/favorite_screen.dart';
import '../../features/home/presentation/pages/home_ui.dart';
import '../../features/notification/presentation/pages/notification_ui.dart';
import '../../features/profile/presentation/pages/profile_ui.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigator();
}

class _BottomNavigator extends State<BottomNavigator> {
  int selectedindex = 0;
  final List<Widget> pages = [
    const HomeUi(),
    const FavoriteScreen(),
    const ListOfNotification(),
    const CartScreen(),
    const ProfileUi()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 4.sh,
        ),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: pages[selectedindex],
    );
  }
}
