import '../../domain/entitiy/address_res_entitiy.dart';

class AddressModel extends AddressEntitiy {
  const AddressModel({
    super.id,
    super.addressId,
    required super.pincode,
    required super.city,
    required super.state,
    required super.country,
    required super.buildName,
    required super.streetName,
    required super.area,
    required super.userId,
    super.createdAt,
    super.updatedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['_id']?.toString(),
      addressId: json['id'],
      pincode: json['pincode'],
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      buildName: json['build_name'] ?? '',
      streetName: json['street_name'] ?? '',
      area: json['area'] ?? '',
      userId: json['user_id'],
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }

  AddressEntitiy toEntity() {
    return AddressEntitiy(
      id: id,
      addressId: addressId,
      pincode: pincode,
      city: city,
      state: state,
      country: country,
      buildName: buildName,
      streetName: streetName,
      area: area,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

class AddressResModel extends AddressResEntitiy {
  const AddressResModel({
    required super.status,
    super.message,
    super.address,
    super.datas,
  });

  factory AddressResModel.fromJson(Map<String, dynamic> json) {
    return AddressResModel(
      status: json['status'] ?? false,
      message: json['message'],
      address: json['address'] != null ? AddressModel.fromJson(json['address']) : null,
      datas: json['datas'] != null
          ? List<AddressEntitiy>.from(
              (json['datas'] as List).map((x) => AddressModel.fromJson(x)))
          : null,
    );
  }

  AddressResEntitiy toEntity() {
    return AddressResEntitiy(
      status: status,
      message: message,
      address: address,
      datas: datas,
    );
  }
}
