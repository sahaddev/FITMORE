import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';

import 'package:cloudinary_url_gen/transformation/effect/effect.dart';
import 'package:cloudinary_url_gen/transformation/gravity/gravity.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:e_commerce/features/splash/presentation/pages/splash_scree.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'core/di/bloc_provider.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = 'UserLoggidIn';

Future<void> main() async {
  // CloudinaryContext is deprecated. Cloudinary configuration is now passed to widgets directly.
  // See usage in App widget below.
  WidgetsFlutterBinding.ensureInitialized();

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
    return AppBlocProvider(
      child: Sizer(
        builder: (context, orientation, deviceType) => const MaterialApp(
          title: "MenCart",
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          home: SplashScreen(),
        ),
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
