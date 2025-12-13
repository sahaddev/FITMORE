import 'dart:math';

import 'package:e_commerce/Widgets/favorite_card.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../data_base/models/favorite/favorite_model.dart';
import '../../../data_base/function/favorite_function.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    favoritee.getAllFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Favorite'),
      floatingActionButton: IconButton(
          onPressed: () {
            int id = Random().nextInt(1000);
            favoritee.addInfavorite(FavoriteModel(
                id: id,
                title: "Test $id",
                price: 1000,
                image:
                    'https://images.unsplash.com/photo-1541643600914-78b084683601?q=80&w=808&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'));
          },
          icon: const Icon(
            Icons.heart_broken,
          )),
      body: ValueListenableBuilder(
        valueListenable: favoriteNotifier,
        builder: (BuildContext context, List<FavoriteModel> favoriteList,
            Widget? child) {
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

              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 130,
                  child: Dismissible(
                    key: Key(data.id.toString()),
                    onDismissed: (direction) {
                      favoritee.deleteFavorite(data.id);
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
                    child: FavoriteCard(image: image, data: data, index: index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
