import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/core/const.dart';
import 'package:e_commerce/service/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  final String baseUrl = "${AppConstants.baseUrl}${AppConstants.user}";
  // ⚠️ On a real device/emulator, replace `localhost`:
  // iOS Simulator → http://127.0.0.1:3000
  // Android Emulator → http://10.0.2.2:3000
  // Physical Device → your PC’s IP address (e.g., http://192.168.x.x:3000)

  /// Add a new user
  Future<String> addUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        return 'User Added';
      } else {
        return "Failed to add user: ${response.body}";
      }
    } catch (e) {
      return "Error in addUser: $e";
    }
  }

  /// Get all users
  Future<List<User>> getAllUsers() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2:3000/api/users"));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        log(data.toString());
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Failed to fetch users: ${response.body}");
      }
    } catch (e) {
      print("Error in getAllUsers: $e");
      return [];
    }
  }

  /// Get a user by MongoDB ID
  Future<User?> getUserById(String id) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$id"));

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to fetch user: ${response.body}");
      }
    } catch (e) {
      throw Exception('Fail to get response $e');
    }
  }

  /// Update a user by ID
  Future<User?> updateUserById(String id, User user) async {
    try {
      final response = await http.put(
        Uri.parse("$baseUrl/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to update user: ${response.body}");
      }
    } catch (e) {
      print("Error in updateUserById: $e");
      return null;
    }
  }

  /// Delete a user by ID
  Future<bool> deleteUserById(String id) async {
    try {
      final response = await http.delete(Uri.parse("$baseUrl/$id"));

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to delete user: ${response.body}");
      }
    } catch (e) {
      print("Error in deleteUserById: $e");
      return false;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ Login successful: ${data['user']}");
        return {
          "message": 'Login successful',
          "login": true,
        };
      } else {
        final error = jsonDecode(response.body)['error'];
        if (response.statusCode == 404) {
          // User not registered
          return {
            "message": '$error',
            "login": true,
          };
        } else if (response.statusCode == 403) {
          // User is blocked
          return {
            "message": '$error',
            "login": false,
          };
        } else if (response.statusCode == 401) {
          return {
            "message": '$error',
            "login": false,
          };
        } else {
          return {
            "message": "Failed to login: ${response.body}",
            "login": false,
          };
        }
      }
    } catch (e) {
      return {
        "message": "Error in login: $e",
        "login": false,
      };
    }
  }
}
