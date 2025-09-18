import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/const.dart';
import 'model/address_model.dart';

class AddressApiService {
  final String baseUrl = "${AppConstants.baseUrl}${AppConstants.address}";

  /// Get all addresses
  Future<List<Address>> getAllAddresses() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Address.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load addresses");
    }
  }

  /// Add a new address
  Future<Address> addAddress(Address address) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(address.toJson()),
    );

    if (response.statusCode == 201) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add address");
    }
  }
}
