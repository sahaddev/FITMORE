import 'dart:math';

import 'package:e_commerce/Widgets/favorite_card.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

import '../../data_base/models/favorite/favorite_model.dart';
import '../../service/favorite.dart';
import '../../service/model/favorite_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // favoritee.getAllFavorite();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Favorite'),
      floatingActionButton: IconButton(
          onPressed: () {
            int id = Random().nextInt(1000);
            FavoriteApiService().addFavorite(Favorite(
                id: id,
                title: "Test $id",
                price: 1000,
                image:
                    'https://images.unsplash.com/photo-1541643600914-78b084683601?q=80&w=808&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'));
            setState(() {});
          },
          icon: const Icon(
            Icons.heart_broken,
          )),
      body: FutureBuilder(
        future: FavoriteApiService().getAllFavorites(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<Favorite> favoriteList = snapshot.data;
            if (favoriteList.isEmpty) {
              return Center(
                  child: Lottie.asset("asset/Animation - 1717653689444.json",
                      height: 250));
            }
            return ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final data = favoriteList[index];
                final image = data.image;

                GlobalKey<FormState> formkey = GlobalKey<FormState>();
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 130,
                    child: ValueListenableBuilder(
                      valueListenable:
                          Hive.box<FavoriteModel>('favorite_db').listenable(),
                      builder: (context, box, child) {
                        return Dismissible(
                          key: formkey,
                          onDismissed: (direction) async {
                            setState(() {
                              favoriteList.removeAt(index);
                            });
                            await box.delete(data.id);
                            // favoritee.deleteFavorite(data.id!);
                          },
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 280),
                              child: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 248, 55, 41),
                              ),
                            ),
                          ),
                          child: FavoriteCard(
                              image: image, data: data, index: index),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
