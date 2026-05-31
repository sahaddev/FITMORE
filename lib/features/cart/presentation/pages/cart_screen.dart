import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/assets/lottie/lottie_json.dart';
import '../../../../core/models/cart_/cart_model.dart';
import '../../../../core/widgets/appbar.dart';
import '../widgets/calcuate_cart.dart';
import '../../../../core/widgets/mainbutton.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('My Cart'),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: ValueNotifier<List<CartModel>>([]),
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                if (cartList.isEmpty) {
                  return Center(
                      child: Lottie.asset(LottieAsset.cartEmpty, height: 250));
                }
                return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final data = cartList[index];
                    final imagebytes = data.image;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        key: Key(data.id.toString()),
                        onDismissed: (direction) {
                          
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width * .3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image(
                                      image: NetworkImage(imagebytes),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          data.title,
                                          style: const TextStyle(
                                              fontSize: 18,
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
                                              fontSize: 16,
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
                                            width: 60,
                                            child: Text(
                                              '\$${data.newPrice}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red,
                                                fontSize: 20,
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    // cartGet.countLessing(
                                                    //   idd: data.id,
                                                    //   imagee: data.image,
                                                    //   pricee: data.price,
                                                    //   quantityy: data.quantity,
                                                    //   titlee: data.title,
                                                    // );
                                                  },
                                                  child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white),
                                                ),
                                                Text('${data.quantity}',
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      // cartGet.countAdding(
                                                      //   idd: data.id,
                                                      //   imagee: data.image,
                                                      //   pricee: data.price,
                                                      //   quantityy:
                                                      //       data.quantity,
                                                      //   titlee: data.title,
                                                      //   context: context,
                                                      // );
                                                    });
                                                  },
                                                  child: const Icon(Icons.add,
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
            ),
          ),
          const SizedBox(height: 10),
          const CalculateCart(),
          ValueListenableBuilder(
            valueListenable: ValueNotifier<List<CartModel>>([]),
            builder: (BuildContext context, List<CartModel> cartList,
                Widget? child) {
              return Visibility(
                // ignore: prefer_is_empty
                visible: cartList.isNotEmpty,
                child: Button(
                    text: 'Check Out',
                    onPressedCallback: () {
                      NavigationService.pushNamed(AppRouters.cartPayment,
                          arguments: {
                            'index': 0,
                            'totelPrice': 0
                          });
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
