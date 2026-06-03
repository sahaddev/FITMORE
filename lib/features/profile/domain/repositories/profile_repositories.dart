import '../entitiy/profile_get_user_res_entitiy.dart';
import '../entitiy/profile_update_user_res_entitiy.dart';

abstract class ProfileRepositories {
  Future<ProfileGetUserResEntitiy> getUserById({required int id});

  Future<ProfileUpdateUserResEntitiy> updateUser({
    required int id,
    required String username,
    required String email,
    required String password,
  });
}
