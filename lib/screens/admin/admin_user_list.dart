import 'dart:convert';
import 'dart:typed_data';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:flutter/material.dart';

class AdminUserListScreen extends StatefulWidget {
  const AdminUserListScreen({super.key});

  @override
  State<AdminUserListScreen> createState() => _AdminUserListScreenState();
}

class _AdminUserListScreenState extends State<AdminUserListScreen> {
  @override
  Widget build(BuildContext context) {
    userr.getAlluser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Users'),
      body: ValueListenableBuilder(
        valueListenable: userListNotifier,
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
                                  AssetImage('asset/images(person).png'),
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
                        final id = data.id;
                        if (isActive) {
                          setState(() {
                            data.active = false;
                          });
                          final user = UserModel(
                              name: data.name,
                              phoneNumber: data.phoneNumber,
                              email: data.email,
                              password: data.password,
                              active: false);
                          userr.updateUser(id ?? 0, user);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('User deactiveted'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          setState(() {
                            data.active = true;
                          });
                          final user = UserModel(
                              name: data.name,
                              phoneNumber: data.phoneNumber,
                              email: data.email,
                              password: data.password,
                              active: true);
                          userr.updateUser(id!, user);
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
