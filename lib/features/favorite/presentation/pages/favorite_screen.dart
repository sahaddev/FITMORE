import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/assets/lottie/lottie_json.dart';
import '../../../../core/models/favorite/favorite_model.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/favorite_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Favorite'),
      floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.heart_broken,
          )),
      body: ValueListenableBuilder(
        valueListenable: ValueNotifier<List<FavoriteModel>>([]),
        builder: (BuildContext context, List<FavoriteModel> favoriteList,
            Widget? child) {
          if (favoriteList.isEmpty) {
            return Center(
                child: Lottie.asset(LottieAsset.favoriteEmpty, height: 250));
          }
          return ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final data = favoriteList[index];
              final image = data.image;

              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 1.h), // Add vertical spacing between items
                child: Dismissible(
                  key: Key(data.id.toString()),
                  onDismissed: (direction) {},
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 248, 55, 41),
                    ),
                  ),
                  child: FavoriteCard(image: image, data: data),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
