import '../repositories/profile_repositories.dart';
import '../entitiy/profile_get_user_res_entitiy.dart';
import '../entitiy/profile_update_user_res_entitiy.dart';
import '../../data/repositories_impl/profile_repo_impli.dart';

class ProfileUsecase {
  ProfileRepositories profileRepositories = ProfileRepoImpl();

  Future<ProfileGetUserResEntitiy> getUserById({required int id}) {
    return profileRepositories.getUserById(id: id);
  }

  Future<ProfileUpdateUserResEntitiy> updateUser({
    required int id,
    required String username,
    required String email,
    required String password,
  }) {
    return profileRepositories.updateUser(
      id: id,
      username: username,
      email: email,
      password: password,
    );
  }
}
