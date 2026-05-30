import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../../../../core/models/user/db_model.dart';
import '../../../../core/widgets/appbar.dart';
import 'package:e_commerce/core/assets/images/app_images.dart';

class AdminUserListScreen extends StatefulWidget {
  const AdminUserListScreen({super.key});

  @override
  State<AdminUserListScreen> createState() => _AdminUserListScreenState();
}

class _AdminUserListScreenState extends State<AdminUserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Users'),
      body: ValueListenableBuilder(
        valueListenable: ValueNotifier<List<UserModel>>([]),
        builder:
            (BuildContext context, List<UserModel> userModel, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                thickness: 2,
                height: 20,
              ),
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) {
                final data = userModel[index];
                bool isActive = data.active;
                final base64Image = data.profile;
                final imageBytes = base64Image != null
                    ? base64.decode(base64Image)
                    : Uint8List.fromList([]);
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: data.profile == null
                          ? const CircleAvatar(
                              radius: 26,
                              backgroundImage:
                                  AssetImage(AppImages.imagesPerson),
                            )
                          : CircleAvatar(
                              radius: 26,
                              backgroundImage: MemoryImage(imageBytes),
                            ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name ?? "sahad",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data.email ?? "sahad@gmail.com",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();

                        if (isActive) {
                          setState(() {
                            data.active = false;
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('User deactiveted'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          setState(() {
                            data.active = true;
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('User Activeted'),
                            backgroundColor: Colors.green,
                          ));
                        }
                      },
                      icon: Icon(
                        isActive
                            ? Icons.person
                            : Icons.person_add_disabled_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                  ],
                );
              },
              itemCount: userModel.length,
            ),
          );
        },
      ),
    );
  }
}
