import '../repositories/auth_repositories.dart';
import '../entitiy/auth_login_res_entitiy.dart';
import '../entitiy/auth_signup_res_entitiy.dart';
import '../../data/repositories_impl/auth_repo_impli.dart';

class AuthUsecase {
  AuthRepositories authRepositories = AuthRepoImpl();

  AuthUsecase({required this.authRepositories});

  Future<AuthLoginResEntitiy> login({
    required String email,
    required String password,
  }) {
    return authRepositories.login(email: email, password: password);
  }

  Future<AuthSignupResEntitiy> signup({
    required String username,
    required String email,
    required String password,
    required String phonenumber,
  }) {
    return authRepositories.signup(
      username: username,
      email: email,
      password: password,
      phonenumber: phonenumber,
    );
  }
}
