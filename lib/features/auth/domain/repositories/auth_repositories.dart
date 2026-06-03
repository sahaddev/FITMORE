import '../entitiy/auth_login_res_entitiy.dart';
import '../entitiy/auth_signup_res_entitiy.dart';

abstract class AuthRepositories {
  Future<AuthLoginResEntitiy> login({
    required String email,
    required String password,
  });

  Future<AuthSignupResEntitiy> signup({
    required String username,
    required String email,
    required String password,
    required String phonenumber,
  });
}
