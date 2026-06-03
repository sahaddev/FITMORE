import 'package:equatable/equatable.dart';

class ProfileUserEntity extends Equatable {
  final String? sId;
  final int? id;
  final String? username;
  final String? email;
  final String? password;
  final String? profileImage;
  final String? phoneNumber;
  final int? ordersCount;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;

  const ProfileUserEntity({
    required this.sId,
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.profileImage,
    required this.phoneNumber,
    required this.ordersCount,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        sId,
        id,
        username,
        email,
        password,
        profileImage,
        phoneNumber,
        ordersCount,
        active,
        createdAt,
        updatedAt,
      ];
}

class ProfileGetUserResEntitiy extends Equatable {
  final bool? status;
  final ProfileUserEntity? user;

  const ProfileGetUserResEntitiy({
    required this.status,
    required this.user,
  });

  @override
  List<Object?> get props => [status, user];
}
