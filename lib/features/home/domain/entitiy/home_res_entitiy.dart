import 'package:equatable/equatable.dart';

class HomeProductEntity extends Equatable {
  final String? sId;
  final int? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? price;
  final String? category;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;
  final String? baseImage;

  const HomeProductEntity({
    required this.sId,
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.price,
    required this.category,
    required this.active,
    required this.baseImage,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });

  @override
  List<Object?> get props => [
        sId,
        id,
        title,
        subTitle,
        description,
        price,
        category,
        active,
        baseImage,
        createdAt,
        updatedAt,
        iV,
      ];
}

class HomeResEntitiy extends Equatable {
  final bool? status;
  final List<HomeProductEntity>? datas;

  const HomeResEntitiy({
    required this.status,
    required this.datas,
  });

  @override
  List<Object?> get props => [status, datas];
}
