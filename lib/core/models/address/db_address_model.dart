
class AddressModel {
    int? id;
    final String name;
    final String city;
    final String state;
    final String pincode;
    final String phonenumber;

  AddressModel({
    this.id,
    required this.name,
    required this.city,
    required this.state,
    required this.pincode,
    required this.phonenumber,
  });
}
