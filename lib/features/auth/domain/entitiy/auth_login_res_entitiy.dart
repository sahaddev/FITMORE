import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? email;

  const AuthUserEntity({
    required this.id,
    required this.username,
    required this.email,
  });

  @override
  List<Object?> get props => [id, username, email];
}

class AuthLoginResEntitiy extends Equatable {
  final bool? status;
  final String? message;
  final String? token;
  final AuthUserEntity? user;

  const AuthLoginResEntitiy({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [status, message, token, user];
}
