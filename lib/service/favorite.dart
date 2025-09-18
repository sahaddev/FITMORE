import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/const.dart';
import 'model/favorite_model.dart';

class FavoriteApiService {
  final String baseUrl = "${AppConstants.baseUrl}${AppConstants.favorite}";

  /// Get all favorites
  Future<List<Favorite>> getAllFavorites() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Favorite.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load favorites");
    }
  }

  /// Add a new favorite
  Future<Favorite> addFavorite(Favorite favorite) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(favorite.toJson()),
    );

    if (response.statusCode == 201) {
      return Favorite.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add favorite");
    }
  }
}
