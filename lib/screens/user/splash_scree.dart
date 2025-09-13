import 'package:e_commerce/application/features/auth/getx/auth_get.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    AuthGet().checkUserLogin(context);
    super.initState();
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
