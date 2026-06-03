import '../../domain/repositories/auth_repositories.dart';
import '../../domain/entitiy/auth_login_res_entitiy.dart';
import '../../domain/entitiy/auth_signup_res_entitiy.dart';
import '../datasource/auth_datasource.dart';

class AuthRepoImpl implements AuthRepositories {
  AuthDatasource authDatasource = AuthDatasourceImpl();

  @override
  Future<AuthLoginResEntitiy> login({
    required String email,
    required String password,
  }) {
    return authDatasource
        .login(email: email, password: password)
        .then((value) => value.toEntity());
  }

  @override
  Future<AuthSignupResEntitiy> signup({
    required String username,
    required String email,
    required String password,
    required String phonenumber,
  }) {
    return authDatasource
        .signup(username: username, email: email, password: password, phonenumber: phonenumber)
        .then((value) => value.toEntity());
  }
}
