import '../../domain/repositories/profile_repositories.dart';
import '../../domain/entitiy/profile_get_user_res_entitiy.dart';
import '../../domain/entitiy/profile_update_user_res_entitiy.dart';
import '../datasource/profile_datasource.dart';

class ProfileRepoImpl implements ProfileRepositories {
  ProfileDatasource profileDatasource = ProfileDatasourceImpl();

  @override
  Future<ProfileGetUserResEntitiy> getUserById({required int id}) {
    return profileDatasource
        .getUserById(id: id)
        .then((value) => value.toEntity());
  }

  @override
  Future<ProfileUpdateUserResEntitiy> updateUser({
    required int id,
    required String username,
    required String email,
    required String password,
  }) {
    return profileDatasource
        .updateUser(
          id: id,
          username: username,
          email: email,
          password: password,
        )
        .then((value) => value.toEntity());
  }
}
