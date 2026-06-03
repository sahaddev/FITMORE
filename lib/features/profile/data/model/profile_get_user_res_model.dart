import '../../domain/entitiy/profile_get_user_res_entitiy.dart';

class ProfileUserModel extends ProfileUserEntity {
  const ProfileUserModel({
    required super.sId,
    required super.id,
    required super.username,
    required super.email,
    required super.password,
    required super.profileImage,
    required super.phoneNumber,
    required super.ordersCount,
    required super.active,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      sId: json['_id'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      profileImage: json['profile_image'],
      phoneNumber: json['phone_number'],
      ordersCount: json['ordersCount'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updatedAt'],
    );
  }

  ProfileUserEntity toEntity() {
    return ProfileUserEntity(
      sId: sId,
      id: id,
      username: username,
      email: email,
      password: password,
      profileImage: profileImage,
      phoneNumber: phoneNumber,
      ordersCount: ordersCount,
      active: active,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

class ProfileGetUserResModel extends ProfileGetUserResEntitiy {
  const ProfileGetUserResModel({
    required super.status,
    required super.user,
  });

  factory ProfileGetUserResModel.fromJson(Map<String, dynamic> json) {
    return ProfileGetUserResModel(
      status: json['status'],
      user: json['user'] != null ? ProfileUserModel.fromJson(json['user']) : null,
    );
  }

  ProfileGetUserResEntitiy toEntity() {
    return ProfileGetUserResEntitiy(
      status: status,
      user: user,
    );
  }
}
