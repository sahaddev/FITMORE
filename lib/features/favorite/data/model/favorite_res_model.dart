import '../../domain/entitiy/favorite_res_entitiy.dart';
import '../../../../features/product_details/data/model/product_details_res_model.dart';

class FavoriteProductModel extends FavoriteProductEntity {
  const FavoriteProductModel({
    super.id,
    super.product,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      id: json['_id'],
      product: json['productId'] != null
          ? ProductModel.fromJson(json['productId'])
          : null,
    );
  }

  FavoriteProductEntity toEntity() {
    return FavoriteProductEntity(
      id: id,
      product: product,
    );
  }
}

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    super.id,
    super.userId,
    super.products,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    int? parsedUserId;
    if (json['userId'] != null) {
      if (json['userId'] is int) {
        parsedUserId = json['userId'];
      } else if (json['userId'] is String) {
        parsedUserId = int.tryParse(json['userId']);
      }
    }

    return FavoriteModel(
      id: json['_id'],
      userId: parsedUserId,
      products: json['products'] != null
          ? List<FavoriteProductModel>.from(
              (json['products'] as List).map((x) => FavoriteProductModel.fromJson(x)))
          : null,
    );
  }

  FavoriteEntity toEntity() {
    return FavoriteEntity(
      id: id,
      userId: userId,
      products: products,
    );
  }
}

class FavoriteResModel extends FavoriteResEntity {
  const FavoriteResModel({
    required super.status,
    super.message,
    super.favorite,
  });

  factory FavoriteResModel.fromJson(Map<String, dynamic> json) {
    return FavoriteResModel(
      status: json['status'] ?? false,
      message: json['message'],
      favorite: json['favorite'] != null
          ? FavoriteModel.fromJson(json['favorite'])
          : null,
    );
  }

  FavoriteResEntity toEntity() {
    return FavoriteResEntity(
      status: status,
      message: message,
      favorite: favorite,
    );
  }
}
