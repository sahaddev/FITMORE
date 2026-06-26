import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/assets/lottie/lottie_json.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/favorite/favorite_bloc.dart';
import '../../../../core/widgets/appbar.dart';
import '../widgets/favorite_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(const FavoriteEvent.load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('Favorite'),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        buildWhen: (previous, current) => current.maybeWhen(
          loaded: (_) => true,
          loading: () => true,
          failure: (_) => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => Center(child: Text(message)),
            loaded: (favoriteList) {
              if (favoriteList.isEmpty) {
                return Center(
                    child:
                        Lottie.asset(LottieAsset.favoriteEmpty, height: 250));
              }
              return ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final data = favoriteList[index];
                  final image = data.product?.image1 ?? '';
                  final id = data.product?.sId ?? data.id ?? '';

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Dismissible(
                      key: Key(id.toString()),
                      onDismissed: (direction) {
                        context.read<FavoriteBloc>().add(
                            FavoriteEvent.removeFromFavorites(
                                data.product?.sId ?? ''));
                      },
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
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
