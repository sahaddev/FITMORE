import 'dart:convert';
import 'dart:developer';

import '../core/const.dart';
import 'model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = "${AppConstants.baseUrl}${AppConstants.product}";

  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        log(data.toString());
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
}
