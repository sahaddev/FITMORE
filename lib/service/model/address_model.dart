class Address {
  final int? id; // optional custom ID
  final String name;
  final String city;
  final String state;
  final String pincode;
  final String phonenumber;

  Address({
    this.id,
    required this.name,
    required this.city,
    required this.state,
    required this.pincode,
    required this.phonenumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      phonenumber: json['phonenumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'state': state,
      'pincode': pincode,
      'phonenumber': phonenumber,
    };
  }
}
