import 'package:flutter/material.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:e_commerce/core/models/user/db_model.dart';

// Feature screens
import '../../features/splash/presentation/pages/splash_scree.dart';
import '../../features/splash/presentation/pages/second_sp.dart';
import '../../features/auth/presentation/pages/signin.dart';
import '../../features/auth/presentation/pages/signup.dart';
import '../../features/home/presentation/pages/home_ui.dart';
import '../../features/home/presentation/pages/product_listing_ui.dart';
import '../../core/widgets/bottom_navigator.dart';
import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/favorite/presentation/pages/favorite_screen.dart';
import '../../features/profile/presentation/pages/profile_ui.dart';
import '../../features/profile/presentation/pages/edit_profile.dart';
import '../../features/address/presentation/pages/address_screen.dart';
import '../../features/address/presentation/pages/add_address.dart';
import '../../features/orders/presentation/pages/myorder_screen.dart';
import '../../features/notification/presentation/pages/notification_ui.dart';
import '../../features/payment/presentation/pages/payment_scr.dart';
import '../../features/terms/presentation/pages/terms.dart';
import '../../features/terms/presentation/pages/about_us.dart';
import '../../features/address/presentation/pages/edit_addres.dart';
import '../../features/product_details/presentation/pages/product_detiles.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouters.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRouters.secondSplash:
        return MaterialPageRoute(builder: (_) => const SecondSp());
      case AppRouters.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRouters.register:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRouters.home:
        return MaterialPageRoute(builder: (_) => const HomeUi());
      case AppRouters.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNavigator());
      case AppRouters.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRouters.favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case AppRouters.profile:
        return MaterialPageRoute(builder: (_) => const ProfileUi());
      case AppRouters.editProfile:
        final user = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (_) => EditProfile(user: user));
      case AppRouters.address:
        return MaterialPageRoute(builder: (_) => const AddressScreen());
      case AppRouters.addAddress:
        return MaterialPageRoute(builder: (_) => const AddAddress());
      case AppRouters.editAddress:
        final index = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => EditAddressScreen(index));
      case AppRouters.orders:
        return MaterialPageRoute(builder: (_) => const MyOrderScreen());
      case AppRouters.notification:
        return MaterialPageRoute(builder: (_) => const ListOfNotification());
      case AppRouters.payment:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(
                  index: args['index'],
                  productIndex: args['productIndex'],
                ));
      case AppRouters.terms:
        return MaterialPageRoute(builder: (_) => const TermsOne());
      case AppRouters.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case AppRouters.productDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => ProductDetiles(
                  index: args['index'],
                  title: args['title'],
                  price: args['price'],
                  image: args['image'],
                  discription: args['discription'],
                ));
      case AppRouters.productListing:
        return MaterialPageRoute(builder: (_) => const ProductListingUi());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
