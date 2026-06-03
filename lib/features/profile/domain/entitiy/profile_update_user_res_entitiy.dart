import 'package:equatable/equatable.dart';
import 'profile_get_user_res_entitiy.dart';

class ProfileUpdateUserResEntitiy extends Equatable {
  final bool? status;
  final ProfileUserEntity? userResponse;

  const ProfileUpdateUserResEntitiy({
    required this.status,
    required this.userResponse,
  });

  @override
  List<Object?> get props => [status, userResponse];
}
