import '../../domain/entitiy/auth_signup_res_entitiy.dart';

class AuthSignupResModel extends AuthSignupResEntitiy {
  const AuthSignupResModel({
    required super.status,
    required super.message,
  });

  factory AuthSignupResModel.fromJson(Map<String, dynamic> json) {
    return AuthSignupResModel(
      status: json['status'],
      message: json['message'],
    );
  }

  AuthSignupResEntitiy toEntity() {
    return AuthSignupResEntitiy(
      status: status,
      message: message,
    );
  }
}
