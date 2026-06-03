import '../../domain/entitiy/product_details_res_entitiy.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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

  ProductEntity toEntity() {
    return ProductEntity(
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

class ProductDetailsResModel extends ProductDetailsResEntitiy {
  const ProductDetailsResModel({
    required super.status,
    required super.product,
  });

  factory ProductDetailsResModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResModel(
      status: json['status'],
      product: json['product'] != null ? ProductModel.fromJson(json['product']) : null,
    );
  }

  ProductDetailsResEntitiy toEntity() {
    return ProductDetailsResEntitiy(
      status: status,
      product: product,
    );
  }
}
