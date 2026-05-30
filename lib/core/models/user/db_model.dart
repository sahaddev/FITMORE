
class UserModel {
    int? id;

    final String? name;

    final String? phoneNumber;

    final String? email;

    final String? password;

    final String? profile;

    bool active;

  UserModel(
      {this.name,
      this.phoneNumber,
      this.email,
      this.password,
      this.profile,
      this.active = true,
      this.id});
}
