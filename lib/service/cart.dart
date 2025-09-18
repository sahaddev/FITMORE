import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/const.dart';
import 'model/cart_model.dart';

class CartApiService {
  final String baseUrl = "${AppConstants.baseUrl}${AppConstants.cart}";

  Future<List<CartModel>> getAllCarts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => CartModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load carts");
    }
  }
}
