import 'package:equatable/equatable.dart';

class AuthSignupResEntitiy extends Equatable {
  final bool? status;
  final String? message;

  const AuthSignupResEntitiy({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
