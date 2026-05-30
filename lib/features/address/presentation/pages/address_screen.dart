import 'package:e_commerce/features/address/presentation/widgets/address_card.dart' show AddressCard;
import '../../../../core/models/address/db_address_model.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/mainbutton.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/core/assets/images/app_images.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';
import 'package:e_commerce/core/routes/app_routers.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Shipping Address'),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: ValueNotifier<List<AddressModel>>([]),
              builder: (
                BuildContext context,
                List<AddressModel> addresslist,
                Widget? child,
              ) {
                if (addresslist.isEmpty) {
                  return const Center(
                    child: SizedBox(
                      height: 350,
                      width: 300,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.addresIsEmpty),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: addresslist.length,
                  itemBuilder: (context, index) {
                    final data = addresslist[index];
                    return AddressCard(
                      index: index,
                      id: data.id,
                      name: data.name,
                      phoneNumber: data.phonenumber,
                      city: data.city,
                      pincode: data.pincode,
                      state: data.state,
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Button(
              text: 'Add Address',
              onPressedCallback: () {
                NavigationService.pushNamed(AppRouters.addAddress);
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
