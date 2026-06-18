import '../../domain/entitiy/auth_login_res_entitiy.dart';

class AuthUserModel extends AuthUserEntity {
  const AuthUserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.phoneNumber,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'] ?? json['phone_number'] ?? json['number'],
    );
  }

  AuthUserEntity toEntity() {
    return AuthUserEntity(
      id: id,
      username: username,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}

class AuthLoginResModel extends AuthLoginResEntitiy {
  const AuthLoginResModel({
    required super.status,
    required super.message,
    required super.token,
    required super.user,
  });

  factory AuthLoginResModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginResModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      user: json['user'] != null ? AuthUserModel.fromJson(json['user']) : null,
    );
  }

  AuthLoginResEntitiy toEntity() {
    return AuthLoginResEntitiy(
      status: status,
      message: message,
      token: token,
      user: user,
    );
  }
}
