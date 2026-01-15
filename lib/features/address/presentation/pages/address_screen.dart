import 'package:e_commerce/core/widgets/address_card.dart' show AddressCard;
import '../../../../core/database/function/address_function.dart';
import '../../../../core/database/models/address/db_address_model.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/mainbutton.dart';
import 'package:flutter/material.dart';

import 'add_address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    addres.getAllAddress();
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
              valueListenable: addressListNotifyer,
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
                        image: AssetImage('asset/addres is empty.png'),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddAdress(),
                ));
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
