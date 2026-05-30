import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:flutter/material.dart';

adminCheckLogin(BuildContext ctx,
    {required context,
    required adminEmailEditingCon,
    required adminPasswordEditingCon}) {
  final email = adminEmailEditingCon.text;
  final password = adminPasswordEditingCon.text;
  if (email == "0" || password == "0") {
    NavigationService.pushNamedAndRemoveUntil(AppRouters.adminBottomNav);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('Invalid user name and password'),
    ));
  }
}
