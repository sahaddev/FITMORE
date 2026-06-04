import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Home
import '../../features/home/presentation/blocs/home/home_bloc.dart';

// Notification
import '../../features/notification/presentation/blocs/notification/notification_bloc.dart';

// Payment
import '../../features/payment/presentation/blocs/payment_last_page/payment_last_page_bloc.dart';
import '../../features/payment/presentation/blocs/payment_address/payment_address_bloc.dart';
import '../../features/payment/presentation/blocs/cart_payment/cart_payment_bloc.dart';
import '../../features/payment/presentation/blocs/payment_scr_two/payment_scr_two_bloc.dart';
import '../../features/payment/presentation/blocs/payment_scr/payment_scr_bloc.dart';

// Terms

// Admin
import '../../features/admin/presentation/blocs/product_edit/product_edit_bloc.dart';
import '../../features/admin/presentation/blocs/coupon_screen/coupon_screen_bloc.dart';
import '../../features/admin/presentation/blocs/admin_user_list/admin_user_list_bloc.dart';
import '../../features/admin/presentation/blocs/dashboard/dashboard_bloc.dart';
import '../../features/admin/presentation/blocs/add_product/add_product_bloc.dart';
import '../../features/admin/presentation/blocs/admin_list/admin_list_bloc.dart';
import '../../features/admin/presentation/blocs/admin_login/admin_login_bloc.dart';

// Favorite
import '../../features/favorite/presentation/blocs/favorite/favorite_bloc.dart';

// Profile
import '../../features/profile/presentation/blocs/profile/profile_bloc.dart';
import '../../features/profile/presentation/blocs/edit_profile/edit_profile_bloc.dart';

// Address
import '../../features/address/presentation/blocs/edit_address/edit_address_bloc.dart';
import '../../features/address/presentation/blocs/address/address_bloc.dart';
import '../../features/address/presentation/blocs/add_address/add_address_bloc.dart';

// Cart
import '../../features/cart/presentation/blocs/cart/cart_bloc.dart';

// Orders
import '../../features/orders/presentation/blocs/order_details/order_details_bloc.dart';
import '../../features/orders/presentation/blocs/my_order/my_order_bloc.dart';

// Product Details
import '../../features/product_details/presentation/blocs/product_details/product_details_bloc.dart';

// Auth
import '../../features/auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import '../../features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;
  const AppBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => NotificationBloc()),
        BlocProvider(create: (context) => PaymentLastPageBloc()),
        BlocProvider(create: (context) => PaymentAddressBloc()),
        BlocProvider(create: (context) => CartPaymentBloc()),
        BlocProvider(create: (context) => PaymentScrTwoBloc()),
        BlocProvider(create: (context) => PaymentScrBloc()),
        BlocProvider(create: (context) => ProductEditBloc()),
        BlocProvider(create: (context) => CouponScreenBloc()),
        BlocProvider(create: (context) => AdminUserListBloc()),
        BlocProvider(create: (context) => DashboardBloc()),
        BlocProvider(create: (context) => AddProductBloc()),
        BlocProvider(create: (context) => AdminListBloc()),
        BlocProvider(create: (context) => AdminLoginBloc()),
        BlocProvider(create: (context) => FavoriteBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => EditProfileBloc()),
        BlocProvider(create: (context) => EditAddressBloc()),
        BlocProvider(create: (context) => AddressBloc()),
        BlocProvider(create: (context) => AddAddressBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => OrderDetailsBloc()),
        BlocProvider(create: (context) => MyOrderBloc()),
        BlocProvider(create: (context) => ProductDetailsBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ],
      child: child,
    );
  }
}
