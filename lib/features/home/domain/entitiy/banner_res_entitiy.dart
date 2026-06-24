import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String? sId;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final bool? active;

  const BannerEntity({
    required this.sId,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.active,
  });

  @override
  List<Object?> get props => [
        sId,
        image1,
        image2,
        image3,
        image4,
        image5,
        active,
      ];
}

class BannerResEntitiy extends Equatable {
  final bool? status;
  final List<BannerEntity>? datas;

  const BannerResEntitiy({
    required this.status,
    required this.datas,
  });

  @override
  List<Object?> get props => [status, datas];
}
