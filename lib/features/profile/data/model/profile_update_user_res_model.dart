import '../../domain/entitiy/profile_update_user_res_entitiy.dart';
import 'profile_get_user_res_model.dart';

class ProfileUpdateUserResModel extends ProfileUpdateUserResEntitiy {
  const ProfileUpdateUserResModel({
    required super.status,
    required super.userResponse,
  });

  factory ProfileUpdateUserResModel.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateUserResModel(
      status: json['status'],
      userResponse: json['userResponse'] != null 
          ? ProfileUserModel.fromJson(json['userResponse']) 
          : null,
    );
  }

  ProfileUpdateUserResEntitiy toEntity() {
    return ProfileUpdateUserResEntitiy(
      status: status,
      userResponse: userResponse,
    );
  }
}
