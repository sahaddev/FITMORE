import '../../domain/entitiy/home_res_entitiy.dart';

class HomeProductModel extends HomeProductEntity {
  const HomeProductModel({
    required super.sId,
    required super.id,
    required super.title,
    required super.subTitle,
    required super.description,
    required super.price,
    required super.category,
    required super.active,
    required super.createdAt,
    required super.updatedAt,
    required super.iV,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      sId: json['_id'],
      id: json['id'],
      title: json['title'],
      subTitle: json['sub_title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }

  HomeProductEntity toEntity() {
    return HomeProductEntity(
      sId: sId,
      id: id,
      title: title,
      subTitle: subTitle,
      description: description,
      price: price,
      category: category,
      active: active,
      createdAt: createdAt,
      updatedAt: updatedAt,
      iV: iV,
    );
  }
}

class HomeResModel extends HomeResEntitiy {
  const HomeResModel({
    required super.status,
    required super.datas,
  });

  factory HomeResModel.fromJson(Map<String, dynamic> json) {
    return HomeResModel(
      status: json['status'],
      datas: json['datas'] != null
          ? List<HomeProductModel>.from(
              (json['datas'] as List).map((e) => HomeProductModel.fromJson(e)))
          : null,
    );
  }

  HomeResEntitiy toEntity() {
    return HomeResEntitiy(
      status: status,
      datas: datas,
    );
  }
}
