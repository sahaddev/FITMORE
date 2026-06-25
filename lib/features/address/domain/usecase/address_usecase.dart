import '../entitiy/address_res_entitiy.dart';
import '../repositories/address_repositories.dart';
import '../../data/repositories_impl/address_repo_impl.dart';

class AddressUsecase {
  AddressRepositories addressRepositories = AddressRepoImpl();

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
    return addressRepositories.createAddress(
      pincode: pincode,
      city: city,
      state: state,
      phonenumber: phonenumber,
      country: country,
      buildName: buildName,
      streetName: streetName,
      area: area,
      userId: userId,
    );
  }

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
    return addressRepositories.updateAddress(
      id: id,
      pincode: pincode,
      city: city,
      state: state,
      phonenumber: phonenumber,
      country: country,
      buildName: buildName,
      streetName: streetName,
      area: area,
      userId: userId,
    );
  }

  Future<AddressResEntitiy> deleteAddress(int id) {
    return addressRepositories.deleteAddress(id);
  }

  Future<AddressResEntitiy> getAddressByUserId(int userId) {
    return addressRepositories.getAddressByUserId(userId);
  }
}
