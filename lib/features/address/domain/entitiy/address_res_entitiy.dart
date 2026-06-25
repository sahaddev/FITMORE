import 'package:equatable/equatable.dart';

class AddressEntitiy extends Equatable {
  final String? id;
  final int? addressId;
  final int pincode;
  final String city;
  final String state;
  final String country;
  final String buildName;
  final String phonenumber;
  final String streetName;
  final String area;
  final int userId;
  final String? createdAt;
  final String? updatedAt;

  const AddressEntitiy({
    this.id,
    this.addressId,
    required this.pincode,
    required this.city,
    required this.state,
    required this.phonenumber,
    required this.country,
    required this.buildName,
    required this.streetName,
    required this.area,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        addressId,
        pincode,
        city,
        state,
        country,
        phonenumber,
        buildName,
        streetName,
        area,
        userId,
        createdAt,
        updatedAt,
      ];
}

class AddressResEntitiy extends Equatable {
  final bool status;
  final String? message;
  final AddressEntitiy? address;
  final List<AddressEntitiy>? datas;

  const AddressResEntitiy({
    required this.status,
    this.message,
    this.address,
    this.datas,
  });

  @override
  List<Object?> get props => [status, message, address, datas];
}
