import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/const.dart';
import 'model/order_model.dart';

class OrderHistoryApiService {
  final String baseUrl = "${AppConstants.baseUrl}${AppConstants.order}";

  Future<List<OrderHistoryModel>> getAllOrderHistories() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => OrderHistoryModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load order histories");
    }
  }
}
