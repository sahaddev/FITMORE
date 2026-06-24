import '../../domain/entitiy/banner_res_entitiy.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.sId,
    required super.image1,
    required super.image2,
    required super.image3,
    required super.image4,
    required super.image5,
    required super.active,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      sId: json['_id'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4'],
      image5: json['image5'],
      active: json['active'],
    );
  }

  BannerEntity toEntity() {
    return BannerEntity(
      sId: sId,
      image1: image1,
      image2: image2,
      image3: image3,
      image4: image4,
      image5: image5,
      active: active,
    );
  }
}

class BannerResModel extends BannerResEntitiy {
  const BannerResModel({
    required super.status,
    required super.datas,
  });

  factory BannerResModel.fromJson(Map<String, dynamic> json) {
    return BannerResModel(
      status: json['status'],
      datas: json['datas'] != null
          ? List<BannerModel>.from(
              (json['datas'] as List).map((e) => BannerModel.fromJson(e)))
          : null,
    );
  }

  BannerResEntitiy toEntity() {
    return BannerResEntitiy(
      status: status,
      datas: datas,
    );
  }
}
