class User {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? profile;
  final bool active;

  User({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.password,
    this.profile,
    this.active = true,
  });

  /// Factory constructor to create a User from JSON (MongoDB document)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      profile: json['profile'] as String?,
      active: json['active'] ?? true,
    );
  }

  /// Convert a User instance to JSON (for API or MongoDB)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'profile': profile,
      'active': active,
    };
  }
}
