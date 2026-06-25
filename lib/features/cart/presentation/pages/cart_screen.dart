import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/assets/lottie/lottie_json.dart';
import '../../../../core/widgets/appbar.dart';
import '../widgets/calcuate_cart.dart';
import '../../../../core/widgets/mainbutton.dart';
import '../blocs/cart/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('My Cart'),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  failure: (message) => Center(child: Text(message)),
                  loaded: (cartEntity) {
                    final cartList = cartEntity.products;
                    if (cartList.isEmpty) {
                      return Center(
                          child:
                              Lottie.asset(LottieAsset.cartEmpty, height: 250));
                    }
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        final data = cartList[index];
                        final productMap = data.productId is Map
                            ? data.productId as Map<String, dynamic>
                            : {};
                        final title = productMap['title'] ?? 'Product';
                        final price = productMap['price'] ?? 0;
                        final imagebytes = productMap['image_one'] ??
                            'https://via.placeholder.com/150';
                        final cartItemId = data.productId is Map
                            ? productMap['_id'].toString()
                            : data.productId.toString();

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            key: Key(cartItemId),
                            onDismissed: (direction) {
                              context
                                  .read<CartBloc>()
                                  .add(RemoveFromCart(cartItemId));
                            },
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 255, 243, 242),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 240, 43, 43),
                                ),
                              ),
                            ),
                            child: Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: double.infinity,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                          image: NetworkImage(imagebytes),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              title,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Size 1$index',
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black45),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  '\$$price',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (data.quantity > 1) {
                                                          context
                                                              .read<CartBloc>()
                                                              .add(DecrementQuantity(
                                                                  cartItemId));
                                                        } else {
                                                          context
                                                              .read<CartBloc>()
                                                              .add(RemoveFromCart(
                                                                  cartItemId));
                                                        }
                                                      },
                                                      child: const Icon(
                                                          Icons.remove,
                                                          color: Colors.white),
                                                    ),
                                                    Text('${data.quantity}',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<CartBloc>()
                                                            .add(IncrementQuantity(
                                                                cartItemId));
                                                      },
                                                      child: const Icon(
                                                          Icons.add,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const CalculateCart(),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              bool isNotEmpty = false;
              state.maybeWhen(
                loaded: (cart) => isNotEmpty = cart.products.isNotEmpty,
                orElse: () {},
              );
              return Visibility(
                visible: isNotEmpty,
                child: Button(
                    text: 'Check Out',
                    onPressedCallback: () {
                      NavigationService.pushNamed(AppRouters.cartPayment,
                          arguments: {'index': 0, 'totelPrice': 0});
                    }),
              );
            },
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
