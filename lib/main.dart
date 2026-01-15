import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';

import 'package:cloudinary_url_gen/transformation/effect/effect.dart';
import 'package:cloudinary_url_gen/transformation/gravity/gravity.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:e_commerce/core/database/models/address/db_address_model.dart';
import 'package:e_commerce/core/database/models/cart_/cart_model.dart';
import 'package:e_commerce/core/database/models/coupon/coupon_model.dart';
import 'package:e_commerce/core/database/models/favorite/favorite_model.dart';
import 'package:e_commerce/core/database/models/order_history/order_history_model.dart';
import 'package:e_commerce/core/database/models/product/db_product_model.dart';
import 'package:e_commerce/core/database/models/user/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';

import 'core/widgets/bottom_navigator.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggidIn';

Future<void> main() async {
  // CloudinaryContext is deprecated. Cloudinary configuration is now passed to widgets directly.
  // See usage in App widget below.
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ProductModelAdapter().typeId)) {
    Hive.registerAdapter(ProductModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AddressModelAdapter().typeId)) {
    Hive.registerAdapter(AddressModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }
  if (!Hive.isAdapterRegistered(FavoriteModelAdapter().typeId)) {
    Hive.registerAdapter(FavoriteModelAdapter());
  }
  if (!Hive.isAdapterRegistered(OrderhistoryModelAdapter().typeId)) {
    Hive.registerAdapter(OrderhistoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CouponModelAdapter().typeId)) {
    Hive.registerAdapter(CouponModelAdapter());
  }

  await Hive.openBox<FavoriteModel>('favorite_db');
  await Hive.openBox<CartModel>('cart_db');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const GetMaterialApp(
        title: "MenCart",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: BottomNavigator(),
      ),
    );
  }
}

// Add a Flutter StatelessWidget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
              width: 200,
              height: 140,
              // Add a Cloudinary CldImageWidget that wraps Flutter's authenticated Image widget.
              child: CldImageWidget(
                  cloudinary:
                      CloudinaryObject.fromCloudName(cloudName: 'fitmore'),
                  publicId: 'cld-sample',
                  transformation: Transformation()
                    // Resize to 250 x 250 pixels using the 'fill' crop mode and 'autoGravity'.
                    ..resize(Resize.fill()
                      ..gravity(Gravity.autoGravity())
                      ..width(250)
                      ..height(250))
                    // Add the 'sepia' effect.
                    ..effect(Effect.sepia()))),
        ),
      ),
    );
  }
}
