import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:e_commerce/main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(SAVE_KEY_NAME) ?? false;
    
    if (isLoggedIn) {
      NavigationService.pushNamedAndRemoveUntil(AppRouters.bottomNav);
    } else {
      NavigationService.pushNamedAndRemoveUntil(AppRouters.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'FITMORE',
          style: TextStyle(
            fontSize: 36,
            color: Color.fromARGB(255, 245, 151, 28),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
