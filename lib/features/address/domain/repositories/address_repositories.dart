import '../entitiy/address_res_entitiy.dart';

abstract class AddressRepositories {
  Future<AddressResEntitiy> createAddress({
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String area,
    required int userId,
  });

  Future<AddressResEntitiy> updateAddress({
    required int id,
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String area,
    required int userId,
  });

  Future<AddressResEntitiy> deleteAddress(int id);

  Future<AddressResEntitiy> getAddressByUserId(int userId);
}
