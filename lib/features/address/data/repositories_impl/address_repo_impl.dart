import '../../domain/entitiy/address_res_entitiy.dart';
import '../../domain/repositories/address_repositories.dart';
import '../datasource/address_datasource.dart';

class AddressRepoImpl implements AddressRepositories {
  AddressDatasource addressDatasource = AddressDatasourceImpl();

  @override
  Future<AddressResEntitiy> createAddress({
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String phonenumber,
    required String area,
    required int userId,
  }) {
    return addressDatasource
        .createAddress(
          pincode: pincode,
          city: city,
          state: state,
          country: country,
          phonenumber: phonenumber,
          buildName: buildName,
          streetName: streetName,
          area: area,
          userId: userId,
        )
        .then((value) => value.toEntity());
  }

  @override
  Future<AddressResEntitiy> updateAddress({
    required int id,
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String phonenumber,
    required String streetName,
    required String area,
    required int userId,
  }) {
    return addressDatasource
        .updateAddress(
          id: id,
          pincode: pincode,
          phonenumber: phonenumber,
          city: city,
          state: state,
          country: country,
          buildName: buildName,
          streetName: streetName,
          area: area,
          userId: userId,
        )
        .then((value) => value.toEntity());
  }

  @override
  Future<AddressResEntitiy> deleteAddress(int id) {
    return addressDatasource
        .deleteAddress(id)
        .then((value) => value.toEntity());
  }

  @override
  Future<AddressResEntitiy> getAddressByUserId(int userId) {
    return addressDatasource
        .getAddressByUserId(userId)
        .then((value) => value.toEntity());
  }
}
