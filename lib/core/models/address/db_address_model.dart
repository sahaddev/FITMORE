
class AddressModel {
    int? id;
    final String name; // maps to build_name
    final String city;
    final String state;
    final String pincode;
    final String phonenumber;
    final String country;
    final String streetName;
    final String area;

  AddressModel({
    this.id,
    required this.name,
    required this.city,
    required this.state,
    required this.pincode,
    required this.phonenumber,
    this.country = '',
    this.streetName = '',
    this.area = '',
  });
}
